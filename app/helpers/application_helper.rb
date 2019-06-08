module ApplicationHelper
    def FirstPreferenceCount state
        parties = Party.order(:position).where(:state => state)
        candidate_id_array = parties.collect{ |party| party.candidates.collect{ |candidate| candidate.id } }.flatten
        
        first_preference_array = candidate_id_array.map{ |id| [id, 0] }.to_h
        second_preference_array = candidate_id_array.map{ |id| [id, candidate_id_array.map{ |id| [id, 0] }.to_h] }.to_h

        num_of_parties = Party.count
        total_num = num_of_parties + Candidate.count

        Vote.find_each do |vote|
            preference = vote.preference.split(',', total_num)
            party_preference = preference[0..num_of_parties-1]
            candidate_preference = preference[num_of_parties..preference.length-1]

            stripped_candidate_preference = candidate_preference.reject(&:blank?).map(&:to_i)

            # logger.debug("Prefrence is: #{preference}")
            # logger.debug("Party preference is: #{party_preference}")
            # logger.debug("Candidate preference is: #{candidate_preference}")

            if !stripped_candidate_preference.empty?
                index_of_first_pref = candidate_preference.index('1') + 1
                # logger.debug("Index of first pref: #{index_of_first_pref}")
                current_first_pref_num = first_preference_array[index_of_first_pref]
                index_of_second_pref = candidate_preference.index('2') + 1
                # logger.debug("Index of second pref: #{index_of_second_pref}")
                current_second_pref_num = second_preference_array[index_of_first_pref][index_of_second_pref]

                # puts first_preference_array[index_of_first_pref]
                # puts second_preference_array[index_of_first_pref][index_of_second_pref]

                first_preference_array[index_of_first_pref] = current_first_pref_num + 1
                # puts first_preference_array[index_of_first_pref]
                
                second_preference_array[index_of_first_pref][index_of_second_pref] = current_second_pref_num + 1
            else
                index_of_first_pref = party_preference.index('1')
                first_party = parties[index_of_first_pref]
                index_of_second_pref = party_preference.index('2')
                
                if first_party.candidates.count > 1
                    party_candidates = first_party.candidates.order(:party_pos)
                    current_first_pref_num = first_preference_array[party_candidates.first.id]
                    current_second_pref_num = second_preference_array[party_candidates.first.id][party_candidates.second.id]
                    
                    first_preference_array[party_candidates.first.id] = current_first_pref_num + 1
                    second_preference_array[party_candidates.first.id][party_candidates.second.id] = current_second_pref_num + 1
                elsif !index_of_second_pref.nil?
                    second_party = parties[index_of_second_pref]
                    current_first_pref_num = first_preference_array[first_party.candidates.first.id]
                    current_second_pref_num = second_preference_array[first_party.candidates.first.id][second_party.candidates.first.id]

                    first_preference_array[first_party.candidates.first.id] = current_first_pref_num + 1
                    second_preference_array[first_party.candidates.first.id][second_party.candidates.first.id] = current_second_pref_num + 1
                else
                    current_first_pref_num = first_preference_array[first_party.candidates.first.id]
                    first_preference_array[first_party.candidates.first.id] = current_first_pref_num + 1
                end
            end
        end

        [first_preference_array, second_preference_array]
    end

    def CalculateTransferingValue quota, count
        (count - quota).to_f / count
    end
end
