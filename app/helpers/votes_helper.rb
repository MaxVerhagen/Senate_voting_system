module VotesHelper
    def PreferenceCleanUp array, cutoff
        sorted_array = array.reject(&:blank?).map(&:to_i).sort

        if sorted_array.empty?
            return array
        end

        # puts sorted_array

        skipped_num = ((1..sorted_array[-1]).to_a - sorted_array)[0].to_i
        repeated_num = sorted_array.detect{ |n| sorted_array.count(n) > 1 && n != 0 }.to_i

        # puts "Number skipped: #{skipped_num}"
        # puts "Number repeated: #{repeated_num}"

        if (repeated_num > 0 && repeated_num <= cutoff) || (skipped_num > 0 && skipped_num <= cutoff) || (skipped_num == 0 && repeated_num == 0)
            return array
        end

        if repeated_num < skipped_num
            if !repeated_num == 0
                min = repeated_num
            else
                min = skipped_num
            end
        else
            if !skipped_num == 0
                min = skipped_num
            else
                min = repeated_num
            end
        end

        # puts "Number min: #{min}"        

        array.map{ |n| n.to_i >= min ? "" : n }
    end
end