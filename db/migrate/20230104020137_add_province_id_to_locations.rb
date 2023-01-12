class AddProvinceIdToLocations < ActiveRecord::Migration[7.0]
  def change
    add_reference :locations, :province, null: false, foreign_key: true
  end
end
