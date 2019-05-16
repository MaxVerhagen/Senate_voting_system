# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Party.destroy_all
Candidate.destroy_all

parties = [{:name => 'Australian Democrats', :name_ab => 'DEM'},
            {:name => 'Australian Labor Party', :name_ab => 'ALP'},
            {:name => 'Australian Protectionist Party', :name_ab => 'APP'},
            {:name => 'Family First Party', :name_ab => 'FFP'},
            {:name => 'Liberal Party of Australia', :name_ab => 'LP'},
            {:name => 'Marijuana (HEMP) Party/Australian Sex Party', :name_ab => 'SXHM'},
            {:name => 'National Party of Australia', :name_ab => 'NP'},
            {:name => 'Nick Xenophon Team', :name_ab => 'XEN'},
            {:name => 'The Greens', :name_ab => 'GRN'},
            {:name => 'Animal Justice Party', :name_ab => 'AJP'},
            {:name => 'Liberal Democrats', :name_ab => 'LD'},
            {:name => 'Indepedent', :name_ab => 'IDP'},
    ]
    .map do |attributes|
        Party.find_or_create_by! attributes
    end

Party.all.each do |party|
    if party.name == 'The Greens'
        Candidate.create!({:given_name => 'Sophie', :surname => 'Guy', :divison_name => 'Adelaide', :state => 'SA', :party_pos => 1, :party_id => party.id})
        Candidate.create!({:given_name => 'Mark', :surname => 'Keough', :divison_name => 'Barker', :state => 'SA', :party_pos => 2, :party_id => party.id})
        Candidate.create!({:given_name => 'Jane', :surname => 'Bange', :divison_name => 'Boothby', :state => 'SA', :party_pos => 3, :party_id => party.id})
        Candidate.create!({:given_name => 'Patrick', :surname => 'O\'Sullivan', :divison_name => 'Hindmarsh', :state => 'SA', :party_pos => 4, :party_id => party.id})
    elsif party.name == 'Family First Party'
        Candidate.create!({:given_name => 'Adrian', :surname => 'Rivish', :divison_name => 'Adelaide', :state => 'SA', :party_pos => 1, :party_id => party.id})
        Candidate.create!({:given_name => 'Yvonne', :surname => 'Zeppel', :divison_name => 'Barker', :state => 'SA', :party_pos => 2, :party_id => party.id})
        Candidate.create!({:given_name => 'Wheatcroft', :surname => 'Gary', :divison_name => 'Boothby', :state => 'SA', :party_pos => 3, :party_id => party.id})
    elsif party.name == 'Liberal Democrats'
        Candidate.create!({:given_name => 'Tyrone', :surname => 'Lock', :divison_name => 'Adelaide', :state => 'SA', :party_pos => 1, :party_id => party.id})
        Candidate.create!({:given_name => 'Luke', :surname => 'Dzivinski', :divison_name => 'Mayo', :state => 'SA', :party_pos => 2, :party_id => party.id})
    end
end