# spec/factories/candidates.rb
FactoryBot.define do
    factory :candidate do |c|
        #A candidate is associated with a political party
        association :party

        #Create unique given name, last name and division for each candidate
        c.sequence(:given_name) { |n| "Bob #{n}"}
        c.sequence(:surname) { |n| "Smith #{n}"}
        c.sequence(:divison_name) { |n| "Divison #{n}"}
        c.sequence(:party_pos) { |n| "#{n}"}

        #Have the candidate state be a random item from a list
        c.state { %w(NSW NT QLD SA TAS VIC WA ACT).sample }
    end
end