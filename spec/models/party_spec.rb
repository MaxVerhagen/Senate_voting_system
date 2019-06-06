# spec/models/party_spec.rb
require 'rails_helper'

describe Party do
    describe "#all_candidates_in_order" do
        context "when a party has no candidates" do
            it "should return an empty list" do
                party = FactoryBot.build(:party)
                expect(party.all_candidates_in_order).to be_empty
            end
        end

        context "when a party has candidates" do
            it "should return a list of all the candidates in order of position in party" do
                party = FactoryBot.build(:party_with_candidates)
                expect(party.all_candidates_in_order).to eq party.candidates
            end
        end
    end

    describe "#re_order_party_pos" do
        context "when deleting a candidate arraged in the middle of the party" do
            it "should not re order before called" do
                party = FactoryBot.create(:party_with_candidates)
                party.candidates.destroy(2)
                expect(party.candidates.find(3).party_pos).to eq 2
            end

            it "should re order later candidates position up one space after called" do
                party = FactoryBot.create(:party_with_candidates)
                party.candidates.destroy(2)
                party.re_order_party_pos
                expect(party.candidates.find(3).party_pos).to eq 1
            end

            it "should not re order earlier candidates' position after called" do
                party = FactoryBot.create(:party_with_candidates)
                party.candidates.destroy(3)
                party.re_order_party_pos
                expect(party.candidates.find(2).party_pos).to eq 1
            end
        end
    end
end