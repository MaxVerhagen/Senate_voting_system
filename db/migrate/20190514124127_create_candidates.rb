class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :given_name
      t.string :surname
      t.string :divison_name
      t.string :state
      t.references :party, foreign_key: true

      t.timestamps
    end
  end
end
