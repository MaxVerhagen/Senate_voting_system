#Go to any specific page for a given party
When /^I goto the (.+) page of "([^"]*)"(?: party)?$/ do |page_type, party_name|
    if page_type == "show"
        visit party_path(Party.find_by_name(party_name).id)
    end
end

#Go to any specific page for a given candidate
When /^I goto the (.+) page of "([^"]*)" "([^"]*)" candidate$/ do |page_type, candidate_given_name, candidate_surname|
    if page_type == "show"
        candidate = Candidate.where(given_name: candidate_given_name, surname: candidate_surname).id
        visit party_candidate_path(Party.find(candidate.party_id), candidate)
    end
end

When /^Choosing candidate "([^"]*)" "([^"]*)" I follow "([^"]*)" link$/ do |candidate_given_name, candidate_surname, page_type|
    if page_type == "Delete"
        find("[name=#{candidate_given_name}_#{candidate_surname}_Delete]").click
    end
end

Then /^I will be on the (.+) page of "([^"]*)"(?: party)?$/ do |page_type, party_name|
    party = Party.find_by(name: party_name)

    if page_type == "new candidate"
        expect(current_path).to eq new_party_candidate_path(party)
    end
end