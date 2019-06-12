class Party < ApplicationRecord
    has_many :candidates, :dependent => :destroy
    validates :name, :name_ab, presence: true

    def all_candidates_in_order
        self.candidates.order(:party_pos).all
    end
    
    def re_order_party_pos
        count = 0

        self.all_candidates_in_order.each do |candidate|
            candidate.update_attributes(party_pos: count)
            count += 1
        end
    end
    

end
