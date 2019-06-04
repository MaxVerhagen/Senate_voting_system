#Definition to drag and drop items in a sortable list
When /^I drag "([^"]*)" "([^"]*)" to position (.+)$/ do |first_name, last_name, position|
    candidate = Candidate.where(given_name: first_name, surname: last_name)
    dest = find("#Candidate_#{position}")
    src = find("#Candidate_#{candidate.first.id}")
    src.drag_to(dest)
end