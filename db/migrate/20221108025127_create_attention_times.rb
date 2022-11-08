class CreateAttentionTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :attention_times do |t|
      t.time :hour_start, null: false
      t.time :hour_end, null: false

      t.timestamps
    end
  end
end
