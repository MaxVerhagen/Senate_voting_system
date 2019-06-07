class Vote < ApplicationRecord
    validates :preference, formal_vote: { num_of_values: Party.count + Candidate.count, num_of_parties: Party.count }
    validates :state, presence: true
end
