class AddBranchOfficeIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :branch_office, null: true
  end
end
