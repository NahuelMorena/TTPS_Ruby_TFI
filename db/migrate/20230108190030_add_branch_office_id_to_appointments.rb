class AddBranchOfficeIdToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :branch_office, null: false, foreign_key: true
  end
end
