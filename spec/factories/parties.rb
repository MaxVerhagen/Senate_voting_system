# spec/factories/parties.rb
FactoryBot.define do
    factory :party do |p|
        #Genereate a unique name for each party
        c.sequence(:name) { |n| "Party #{n}"}
        c.sequence(:name_ab) { |n| "P #{n}"}
    end

    factory :party_with_candidates, parent: :party do
        transient do
            candidates_count 5
        end

        #Create five candidates and associate them with this party
        after(:create) do |party, evaluator|
            create_list(:candidate, evaluator.candidates_count, party: party)
        end
    end
end