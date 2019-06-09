# app/validators/formal_vote_validator.rb

class FormalVoteValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        # puts "Value is : #{value}"

        if options[:num_of_values] == 25
            num_of_parties = options[:num_of_parties]
            num_of_values = options[:num_of_values]
        elsif value.length < 87
            num_of_parties = 8
            num_of_values = 21
        else
            num_of_parties = options[:num_of_parties]
            num_of_values = options[:num_of_values]
        end


        preference = value.split(',', num_of_values)
        party_preference = preference[0..num_of_parties-1]
        candidate_preference = preference[num_of_parties..preference.length-1]

        # puts "Pref is: #{preference}"
        # puts "Party pref: #{party_preference}"
        # puts "Candidate pref: #{candidate_preference}"

        stripped_party_preference = party_preference.reject(&:blank?).map(&:to_i)
        stripped_candidate_preference = candidate_preference.reject(&:blank?).map(&:to_i)
        
        formal_vote = false
        in_formal = false

        if !stripped_candidate_preference.empty?
            if !((1..6).to_a - stripped_candidate_preference).empty?
                record.errors.add(attribute, "You are voting below the line and need to number at least twelve boxes from 1 to 12.")
                in_formal = true
            else
                repeat_num = stripped_candidate_preference.detect{ |e| stripped_candidate_preference.count(e) > 1 }

                if !repeat_num.blank? && repeat_num <= 6
                    record.errors.add(attribute, "You are voting below the line and you have entered number #{repeat_num} more than once.")
                    in_formal = true
                else
                    formal_vote = true
                end
            end
        end

        if !stripped_party_preference.empty? && formal_vote == false && in_formal == false
            if !stripped_party_preference.include? 1
                record.errors.add(attribute, "You are voting above the line and need to number at least six boxes from 1 to 6.")                
                in_formal = true
            else
                repeat_num = stripped_party_preference.detect{ |e| stripped_party_preference.count(e) > 1 }

                if !repeat_num.blank? && repeat_num == 1
                    record.errors.add(attribute, "You are voting above the line and you have entered number #{repeat_num} more than once.")
                    in_formal = true
                else
                    formal_vote = true
                end
            end
        end

        if formal_vote == false && in_formal == false
            record.errors.add(attribute, "No boxes have been numbered.")
        end
    end
end