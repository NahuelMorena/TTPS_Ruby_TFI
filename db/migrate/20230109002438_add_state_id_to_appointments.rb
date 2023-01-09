class AddStateIdToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :state, null: false, default: 1, foreign_key: true
  end
end
