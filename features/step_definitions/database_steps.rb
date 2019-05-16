# Create new objects in specified database table with provided information
Given /^these (.+) exist:$/ do |db_name, db_table|
    if db_name == 'parties'
        db_table.hashes.each do |party_info|
            Party.create!(party_info)
        end
    elsif db_name == 'candidates'
        db_table.hashes.each do |candidate_info|
            Candidate.create!(candidate_info)
        end
    end
end