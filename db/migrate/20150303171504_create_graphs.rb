class CreateGraphs < ActiveRecord::Migration
  def change
    create_table :graphs do |t|
      t.string :filename
      t.integer :campaign_id
      t.integer :user_id
      t.string :path

      t.timestamps
    end
  end
end
