# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Party.destroy_all
Candidate.destroy_all

parties = [{:name => 'Australian Democrats', :name_ab => 'DEM', :position=> 0, :state => "SA"},
            {:name => 'Australian Labor Party', :name_ab => 'ALP', :position=> 1, :state => "SA"},
            {:name => 'Australian Protectionist Party', :name_ab => 'APP', :position=> 2, :state => "SA"},
            {:name => 'Family First Party', :name_ab => 'FFP', :position=> 3, :state => "SA"},
            {:name => 'Liberal Party of Australia', :name_ab => 'LP', :position=> 4, :state => "SA"},
            {:name => 'Marijuana (HEMP) Party', :name_ab => 'SXHM', :position=> 5, :state => "SA"},
            {:name => 'National Party of Australia', :name_ab => 'NP', :position=> 6, :state => "SA"},
            {:name => 'Nick Xenophon Team', :name_ab => 'XEN', :position=> 7, :state => "SA"},
            {:name => 'The Greens', :name_ab => 'GRN', :position=> 8, :state => "SA"},
            {:name => 'Animal Justice Party', :name_ab => 'AJP', :position=> 9, :state => "SA"},
            {:name => 'Liberal Democrats', :name_ab => 'LD', :position=> 10, :state => "SA"},
            {:name => 'Indepedent', :name_ab => 'IDP', :position=> 11, :state => "SA"},
    ]
    .map do |attributes|
        Party.find_or_create_by! attributes
    end

Party.all.each do |party|
    if party.name == 'The Greens'
        Candidate.create!({:given_name => 'Sophie', :surname => 'Guy', :divison_name => 'Adelaide', :state => 'SA', :party_pos => 0, :party_id => party.id})
        Candidate.create!({:given_name => 'Mark', :surname => 'Keough', :divison_name => 'Barker', :state => 'SA', :party_pos => 1, :party_id => party.id})
        Candidate.create!({:given_name => 'Jane', :surname => 'Bange', :divison_name => 'Boothby', :state => 'SA', :party_pos => 2, :party_id => party.id})
        Candidate.create!({:given_name => 'Patrick', :surname => 'O\'Sullivan', :divison_name => 'Hindmarsh', :state => 'SA', :party_pos => 3, :party_id => party.id})
    elsif party.name == 'Family First Party'
        Candidate.create!({:given_name => 'Adrian', :surname => 'Rivish', :divison_name => 'Adelaide', :state => 'SA', :party_pos => 0, :party_id => party.id})
        Candidate.create!({:given_name => 'Yvonne', :surname => 'Zeppel', :divison_name => 'Barker', :state => 'SA', :party_pos => 1, :party_id => party.id})
        Candidate.create!({:given_name => 'Wheatcroft', :surname => 'Gary', :divison_name => 'Boothby', :state => 'SA', :party_pos => 2, :party_id => party.id})
    elsif party.name == 'Liberal Democrats'
        Candidate.create!({:given_name => 'Tyrone', :surname => 'Lock', :divison_name => 'Adelaide', :state => 'SA', :party_pos => 0, :party_id => party.id})
        Candidate.create!({:given_name => 'Luke', :surname => 'Dzivinski', :divison_name => 'Mayo', :state => 'SA', :party_pos => 1, :party_id => party.id})
    end
end
