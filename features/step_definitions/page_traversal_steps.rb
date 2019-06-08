#Go to any specific page for a given party
When /^I goto the (.+) page of "([^"]*)"(?: party)?$/ do |page_type, party_name|
    if page_type == "show"
        visit party_path(Party.find_by_name(party_name).id)
    elsif page_type == "voting"
        visit new_vote_path(state: party_name)
    end
end

#Go to any specific page for a given candidate
When /^I goto the (.+) page of "([^"]*)" "([^"]*)" candidate$/ do |page_type, candidate_given_name, candidate_surname|
    if page_type == "show"
        candidate = Candidate.where(given_name: candidate_given_name, surname: candidate_surname).id
        visit party_candidate_path(Party.find(candidate.party_id), candidate)
    end
end

Then /^I will be on the (.+) page of "([^"]*)"(?: party)?$/ do |page_type, party_name|
    party = Party.find_by(name: party_name)

    if page_type == "new candidate"
        expect(page).to have_current_path(new_party_candidate_path(party))
    end
end

Then /^I will be on the thank you page$/ do
    expect(page).to have_current_path(vote_thank_you_path())
end

Then /^I will be on voting page of "([^"]*)"$/ do |state|
    expect(page).to have_current_path(new_vote_path(state: state))
end