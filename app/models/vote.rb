class Vote < ApplicationRecord
    validates :preference, formal_vote: { num_of_values: 87, num_of_parties: 23 }
    validates :state, presence: true
end
