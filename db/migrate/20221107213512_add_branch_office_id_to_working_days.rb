class AddBranchOfficeIdToWorkingDays < ActiveRecord::Migration[7.0]
  def change
    add_reference :working_days, :branch_office, null: false, foreign_key: true
  end
end
