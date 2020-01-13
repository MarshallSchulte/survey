class AddExecutiveSponsorToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :executive_sponsor, :string
  end
end
