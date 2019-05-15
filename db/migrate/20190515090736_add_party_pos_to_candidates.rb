class AddPartyPosToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :party_pos, :integer
  end
end
