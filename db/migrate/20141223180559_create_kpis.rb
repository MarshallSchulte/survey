class CreateKpis < ActiveRecord::Migration
  def change
    create_table :kpis do |t|
      t.integer :metric_id
      t.string :kpi
      t.text :kpi_measurement

      t.timestamps
    end
  end
end
