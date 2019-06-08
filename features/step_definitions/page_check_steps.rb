When /^I select these values for these boxes:$/ do |select_table|
    select_table.rows_hash.each do |field, value|
        step %{I select "#{value}" from "#{field}"}
    end
end

Then /^I should see a list of these parties for voting:$/ do |party_table|
    expected_names = party_table.hashes.collect { |party| party['party_name'] }
    within('div[class=scrolling-wrapper]') do
        collected_names = all('div[name=party-name]').collect(&:text)
        expect(collected_names).to eq(expected_names)
    end
end

Then /^I should see a list of these candidates:$/ do |candidates_table|
    expected_names = candidates_table.hashes.collect { |candidate| candidate['given_name'] }
    expected_surnames = candidates_table.hashes.collect { |candidate| candidate['surname'] }
    within('table[id=candidates]') do
        collected_names = all('td[name=candidate-name]').collect(&:text)
        collected_surnames = all('td[name=candidate-surname]').collect(&:text)
        expect(collected_names).to eq(expected_names)
        expect(collected_surnames).to eq(expected_surnames)
    end
end

Then /^I should see a list of these candidates with position:$/ do |candidates_table|
    expected_names = candidates_table.hashes.collect { |candidate| candidate['given_name'] }
    expected_surnames = candidates_table.hashes.collect { |candidate| candidate['surname'] }
    expected_position = candidates_table.hashes.collect { |candidate| candidate['party_pos'] }
    within('table[id=candidates]') do
        collected_names = all('td[name=candidate-name]').collect(&:text)
        collected_surnames = all('td[name=candidate-surname]').collect(&:text)
        collected_position = all('td[name=candidate-sort-pos]').collect(&:text)
        expect(collected_names).to eq(expected_names)
        expect(collected_surnames).to eq(expected_surnames)
        expect(collected_position).to eq(expected_position)
    end
end

Then /^I should see no candidates$/ do
    within('table[id=candidates]') do
        collected_names = all('td[name=candidate-name]').collect(&:text)
        expect(collected_names).to be_empty
    end
end