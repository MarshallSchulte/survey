class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :tier
      t.string :name
      t.string :status
      t.date :start_date
      t.date :end_date
      t.references :user, index: true

      t.timestamps
    end
  end
end
