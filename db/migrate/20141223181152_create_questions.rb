class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :metric_id
      t.integer :kpi_id

      t.timestamps
    end
  end
end
