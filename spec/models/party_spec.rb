require 'rails_helper'

describe Party do
    describe '#all_candidates' do
        context 'when a party has no candidates' do
            it 'should return an empty list' do
                party = FactoryBot.build(:party)
                expect(party.all_candidates).to be_empty
            end
        end

        context 'when a party has candidates' do
            it 'should return a list of all the candidates' do
                party = FactoryBot.build(:party_with_candidates)
                expect(party.all_candidates).to eq party.candidates
            end
        end
    end
end