class CreateAggregatedStats < ActiveRecord::Migration[6.1]
  def change
    create_table :aggregated_stats do |t|
      t.references :device, null: false, foreign_key: true
      t.integer :measurement
      t.float :value
      t.string :hour_at
    end
  end
end
