class Candidate < ApplicationRecord
  belongs_to :party
  
  validates :given_name, :surname, :divison_name, :state, :party_pos, presence: true
end
