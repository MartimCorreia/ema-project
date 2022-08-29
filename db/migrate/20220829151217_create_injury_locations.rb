class CreateInjuryLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :injury_locations do |t|
      t.string :name

      t.timestamps
    end
  end
end
