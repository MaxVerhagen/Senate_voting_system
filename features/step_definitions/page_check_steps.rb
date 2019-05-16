Then /^I should see these candidates:$/ do |candidates_table|
    expected_names = candidates_table.hashes.collect { |candidate| candidate['given_name'] }
    expected_surnames = candidates_table.hashes.collect { |candidate| candidate['surname'] }
    within('table[id=candidates]') do
        collected_names = all('td[name=candidate-name]').collect(&:text)
        collected_surnames = all('td[name=candidate-surname]').collect(&:text)
        expect(collected_names).to eq(expected_names)
        expect(collected_surnames).to eq(expected_surnames)
    end
end