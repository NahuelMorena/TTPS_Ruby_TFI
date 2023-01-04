class AddLocationIdToBranchOffices < ActiveRecord::Migration[7.0]
  def change
    add_reference :branch_offices, :location, null: false, foreign_key: true
  end
end
