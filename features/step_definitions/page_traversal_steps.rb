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