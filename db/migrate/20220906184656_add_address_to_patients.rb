class AddAddressToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :address, :string
  end
end
