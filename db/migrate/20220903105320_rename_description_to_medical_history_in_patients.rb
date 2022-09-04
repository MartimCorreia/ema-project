class RenameDescriptionToMedicalHistoryInPatients < ActiveRecord::Migration[7.0]
  def change
    rename_column :patients, :description, :medical_history
  end
end
