class AddTemplateToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :template, :boolean
  end
end
