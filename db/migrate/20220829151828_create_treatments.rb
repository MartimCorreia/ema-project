class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments do |t|
      t.string :content
      t.string :age_group
      t.references :injury_location, null: false, foreign_key: true
      t.references :injury_type, null: false, foreign_key: true
      t.references :condition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
