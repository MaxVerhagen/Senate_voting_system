# spec/factories/parties.rb
FactoryBot.define do
    factory :party do |p|
        #Genereate a unique name for each party
        p.sequence(:name) { |n| "Party #{n}"}
        p.sequence(:name_ab) { |n| "P #{n}"}
    end

    factory :party_with_candidates, parent: :party do
        #Create five candidates and associate them with this party
        after(:create) do |party|
            create_list(:candidates, 5, party: party)
        end
    end
end