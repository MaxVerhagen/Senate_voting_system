class AddVotesColume < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :state, :string
  end
end
