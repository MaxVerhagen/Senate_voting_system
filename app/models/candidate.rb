class Candidate < ApplicationRecord
  include RailsSortable::Model

  belongs_to :party
  set_sortable :party_pos
end
