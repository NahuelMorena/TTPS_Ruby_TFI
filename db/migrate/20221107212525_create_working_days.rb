class CreateWorkingDays < ActiveRecord::Migration[7.0]
  def change
    create_table :working_days do |t|
      t.string :day, null: false

      t.timestamps
    end
  end
end
