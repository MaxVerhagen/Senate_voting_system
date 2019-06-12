# spec/validators/formal_vote_validator_spec.rb
require 'rails_helper'

RSpec.describe FormalVoteValidator do
    with_model :VoteTest do
        model do
            attr_accessor :preference
            validates :preference, formal_vote: { num_of_values: 25, num_of_parties: 10 }
        end
    end

    let(:vote) { VoteTest.new }
    #",2,3,4,5,6,6,,,,,,,,,,,,,,,,,,"
    context "when formal votes are submitted" do
        it "should count only one box marked with one above the line as a formal vote" do
            vote.preference = ",,,,1,,,,,,,,,,,,,,,,,,,,"
            expect(vote.valid?).to be_truthy
        end 

        it "should count box marked with number one and one or more higher numbers above the line as a formal vote" do
            vote.preference = "5,3,2,4,1,6,,,,,,,,,,,,,,,,,,,"
            expect(vote.valid?).to be_truthy
        end

        it "should disregard numbers that are repeated and higher number marked in boxes above the line and count as a formal vote" do
            vote.preference = "5,3,2,4,1,6,3,5,,,,,,,,,,,,,,,,,"
            expect(vote.valid?).to be_truthy
        end

        it "should disregard any missed number and higher number marked in boxes above the line and cound as a formal vote" do
            vote.preference = "5,3,2,,1,6,,,,,,,,,,,,,,,,,,,"
            expect(vote.valid?).to be_truthy
        end

        it "should disregard boxes marked above the line if boxes have been marked both above and below the line" do
            vote.preference = ",,,3,,,4,,,,1,,2,3,4,6,5,,,,,,,,"
            expect(vote.valid?).to be_truthy
        end

        it "should count boxes numbered from one to six below the line as a formal vote" do
            vote.preference = ",,,,,,,,,,1,,2,3,4,6,5,,,,,,,,"
            expect(vote.valid?).to be_truthy
        end

        it "should count boxes numbered from one to six and any higher number below the line as a formal vote" do
            vote.preference = ",,,,,,,,,,1,,2,3,4,6,5,8,9,12,10,11,7,,"
            expect(vote.valid?).to be_truthy
        end

        it "should disregard numbers that are repeated and higher number marked in boxes below the line and count as a formal vote" do
            vote.preference = ",,,,,,,,,,1,,2,3,4,6,5,7,7,8,,,,,"
            expect(vote.valid?).to be_truthy
        end

        it "should disregard any missed number and higher number marked in boxes below the line and cound as a formal vote" do
            vote.preference = ",,,,,,,,,,1,,2,3,4,6,5,7,,8,,11,12,,"
            expect(vote.valid?).to be_truthy
        end
    end

    context "when informal votes are submitted" do
        it "should count vote as informal if there is no box marked with number one above the line and no boxes have been marked below the line" do
            vote.preference = ",,5,6,4,3,,,,,,,,,,,,,,,,,,,"
            expect(vote.valid?).to be_falsey
            expect(vote.errors[:preference]).to include("You are voting above the line and need to number at least six boxes from 1 to 6.")
        end

        it "should count vote as informal if there are two boxes marked one above the line" do
            vote.preference = ",,5,1,4,3,1,,,,,,,,,,,,,,,,,,"
            expect(vote.valid?).to be_falsey
            expect(vote.errors[:preference]).to include("You are voting above the line and you have entered number 1 more than once.")
        end

        it "should count vote as informal if there are no boxes marked from one to six below the line" do
            vote.preference = ",,,,,,,,,,,,2,3,,6,5,,,,,,,,"
            expect(vote.valid?).to be_falsey
            expect(vote.errors[:preference]).to include("You are voting below the line and need to number at least twelve boxes from 1 to 12.")
        end

        it "should count vote as informal if there are repeated numbers marked between one and six below the line" do
            vote.preference = ",,,,,,,,,,,1,2,3,2,6,5,4,,,,,,,"
            expect(vote.valid?).to be_falsey
            expect(vote.errors[:preference]).to include("You are voting below the line and you have entered number 2 more than once.")
        end

        it "should count vote as informal if both above the line and below the line boxes are marked but below the line boxes are not valid" do
            vote.preference = ",6,2,3,1,4,5,,,,,1,2,3,2,6,5,4,,,,,,,"
            expect(vote.valid?).to be_falsey
            expect(vote.errors[:preference]).to include("You are voting below the line and you have entered number 2 more than once.")
        end

        it "should count vote as informal if no boxes are marked" do
            vote.preference = ",,,,,,,,,,,,,,,,,,,,,,,,"
            expect(vote.valid?).to be_falsey
            expect(vote.errors[:preference]).to include("No boxes have been numbered.")
        end
    end
end