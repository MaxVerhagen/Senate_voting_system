class ChangePartiesSequenceColumnName < ActiveRecord::Migration[5.2]
  def up
    change_column :parties, :sequence, :integer
    rename_column :parties, :sequence, :position
  end

  def down
    change_column :parties, :position, :string
    rename_column :parties, :position, :sequence
  end
end
