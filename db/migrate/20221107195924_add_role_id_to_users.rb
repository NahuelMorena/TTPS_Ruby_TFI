class AddRoleIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :role, null: false, default: 3, foreign_key: true
  end
end
