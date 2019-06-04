class Candidate < ApplicationRecord
  include RailsSortable::Model

  belongs_to :party
  set_sortable :party_pos
  
  validates :given_name, :surname, :divison_name, :state, :party_pos, presence: true
end
