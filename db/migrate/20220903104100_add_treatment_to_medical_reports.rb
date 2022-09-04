class AddTreatmentToMedicalReports < ActiveRecord::Migration[7.0]
  def change
    add_reference :medical_reports, :treatment, null: false, foreign_key: true
  end
end
