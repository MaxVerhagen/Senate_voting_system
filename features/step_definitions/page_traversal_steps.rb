#Go to any specific page for a given party
When /^I goto the (.+) page of "([^"]*)"(?: party)?$/ do |page_type, party_name|
    puts Party.find_by_name(party_name).id
    if page_type == "show"
        visit party_path(Party.find_by_name(party_name).id)
    end
end

#Go to any specific page for a given candidate
When /^I goto the (.+) page of "([^"]*)" "([^"]*)" candidate$/ do |page_type, candidate_given_name, candidate_surname|
    if page_type == "show"
        candidate = Candidate.where(given_name: candidate_given_name, surname: candidate_surname).first
        visit party_candidate_path(Party.find(candidate.party_id), candidate.id)
    end
end

When /^Choosing candidate "([^"]*)" "([^"]*)" I follow "([^"]*)" link$/ do |candidate_given_name, candidate_surname, page_type|
    if page_type == "Delete"
        find("[name=#{candidate_given_name}_#{candidate_surname}_Delete]").click
    elsif page_type == "Edit"
        find("[name=#{candidate_given_name}_#{candidate_surname}_Edit]").click
    end
end

Then /^I will be on the (.+) page of "([^"]*)"(?: party)?$/ do |page_type, party_name|
    party = Party.find_by(name: party_name)

    if page_type == "new candidate"
        expect(current_path).to eq new_party_candidate_path(party)
    elsif page_type == "edit"
        expect(current_path).to eq edit_party_path(party)
    else page_type == "show"
        expect(current_path).to eq(party_path(party))
    end
end

Then /^I will be on the edit page of "([^"]*)" "([^"]*)" candidate of "([^"]*)"(?: party)?$/ do |candidate_given_name, candidate_surname, party_name|
    party = Party.find_by(name: party_name)
    candidate = Candidate.where(given_name: candidate_given_name, surname: candidate_surname).first

    expect(current_path).to eq edit_party_candidate_path(party, candidate.id)
end

Then /^I will be on admin home page$/ do
    expect(current_path).to eq parties_path
end