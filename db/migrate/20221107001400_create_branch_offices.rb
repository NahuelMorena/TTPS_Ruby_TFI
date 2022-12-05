class CreateBranchOffices < ActiveRecord::Migration[7.0]
  def change
    create_table :branch_offices do |t|
      t.string :name, null: false, unique: true
      t.string :direction, null: false
      t.string :phone, null: false

      t.timestamps
    end
  end
end
