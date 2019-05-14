class Party < ApplicationRecord
    has_many :candidates

    def all_candidates
        self.candidates
    end
end
