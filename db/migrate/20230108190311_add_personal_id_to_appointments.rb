class AddPersonalIdToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :personal, null: true
  end
end
