class Party < ApplicationRecord
    has_many :candidates

    def all_candidates_in_order
        self.candidates.order(:party_pos)
    end
    
    def re_order
        temp = self.candidates.order(:party_pos)
        for x in self.candidates do
            x.party_pos = x 
        end
    end
    

end
