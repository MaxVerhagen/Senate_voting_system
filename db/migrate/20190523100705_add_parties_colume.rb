class AddPartiesColume < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :sequence, :string
    add_column :parties, :state, :string
  end
end
