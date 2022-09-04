class CreateMedicalReports < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_reports do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :hospital
      t.string :diagnosis
      t.string :medical_history

      t.timestamps
    end
  end
end
