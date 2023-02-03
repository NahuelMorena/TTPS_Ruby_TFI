class AddUniqueAtributeToNameBranchOffice < ActiveRecord::Migration[7.0]
  def change
    add_index :branch_offices, :name, unique: true
  end
end
