class AddWeightToMetric < ActiveRecord::Migration
  def change
    add_column :metrics, :weight, :integer
  end
end
