class Candidate < ApplicationRecord
  belongs_to :party, :dependent => :delete
end
