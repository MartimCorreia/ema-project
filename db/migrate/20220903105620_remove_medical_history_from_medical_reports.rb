class RemoveMedicalHistoryFromMedicalReports < ActiveRecord::Migration[7.0]
  def change
    remove_column :medical_reports, :medical_history
  end
end
