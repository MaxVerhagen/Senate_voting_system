class ApplicationController < ActionController::Base
    def vote_count
        number_to_be_elected = 1
        quota = 1000 #(Vote.count.to_f / (number_to_be_elected + 1)).floor + 1
        candidate_out = []

        logger.debug("Quota is: #{quota}")
        
        results_round_one = view_context.FirstPreferenceCount "SA"
        puts results_round_one[0]
        puts results_round_one[1]

        candidates_meeting_quota = results_round_one[0].select{ |id, count| count > quota }
        
        while !candidates_meeting_quota.empty? do
            item = candidates_meeting_quota.shift
            transfer_value = view_context.CalculateTransferingValue quota, item[1]
            candidate_out.push item[0]

            logger.debug("Transfering surplus votes from candidate: #{item[0]}")
            logger.debug("Transfer value is: #{transfer_value}")

            second_pref = results_round_one[1][item[0]].max_by{|k,v| v}

            logger.debug("Max second pref key: #{second_pref[0]} value: #{second_pref[1]}")

            while candidate_out.include? second_pref[0] do
                logger.debug("Candidate already out")
                results_round_one[1][item[0]].delete(second_pref[0])
                second_pref = results_round_one[1][item[0]].max_by{|k,v| v}
            end

            logger.debug("Max second pref key: #{second_pref[0]} value: #{second_pref[1]}")

            results_round_one[0][second_pref[0]] = results_round_one[0][second_pref[0]] + (second_pref[1] * transfer_value).floor

            logger.debug("Transfering #{(second_pref[1] * transfer_value).floor} counts to candidate #{second_pref[0]}")
            logger.debug("New candidate #{second_pref[0]} count is: #{results_round_one[0][second_pref[0]]}")

            if results_round_one[0][second_pref[0]] > quota
                logger.debug("New count for candidate #{second_pref[0]} is above quote #{quota}")
                candidates_meeting_quota[second_pref[0]] = results_round_one[0][second_pref[0]]
            end
        end

        logger.debug("Quota was: #{quota}")
        logger.debug("All elected candidates: #{candidate_out}")
        puts results_round_one[0]
        # puts results_round_one[1]
    end
end

