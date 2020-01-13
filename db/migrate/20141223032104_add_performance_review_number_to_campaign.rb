class AddPerformanceReviewNumberToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :performance_review_number, :integer
  end
end
