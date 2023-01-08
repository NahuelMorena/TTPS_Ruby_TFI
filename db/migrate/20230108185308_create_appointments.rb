class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :date, null: false
      t.time :hour, null: false
      t.string :reason, null: false
      t.string :result

      t.timestamps
    end
  end
end
