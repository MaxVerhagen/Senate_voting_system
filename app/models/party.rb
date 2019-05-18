class Party < ApplicationRecord
    has_many :candidates

    def all_candidates_in_order
        self.candidates.order(:party_pos)
    end

end
