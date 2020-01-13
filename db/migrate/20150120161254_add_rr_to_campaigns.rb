class AddRrToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :rr, :boolean
  end
end
