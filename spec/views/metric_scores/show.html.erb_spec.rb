require 'rails_helper'

RSpec.describe "metric_scores/show", :type => :view do
  before(:each) do
    @metric_score = assign(:metric_score, MetricScore.create!(
      :metric_id => 1,
      :campaign_id => 2,
      :customer_id => 3,
      :vendor_id => 4,
      :actual_score => 5,
      :total_score => 6
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
  end
end
