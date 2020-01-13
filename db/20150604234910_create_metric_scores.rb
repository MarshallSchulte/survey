class CreateMetricScores < ActiveRecord::Migration
  def change
    create_table :metric_scores do |t|
      t.integer :metric_id
      t.integer :campaign_id
      t.integer :customer_id
      t.integer :vendor_id
      t.integer :actual_score
      t.integer :total_score

      t.timestamps
    end
  end
end
