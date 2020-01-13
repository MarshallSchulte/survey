require 'rails_helper'

RSpec.describe "metric_scores/index", :type => :view do
  before(:each) do
    assign(:metric_scores, [
      MetricScore.create!(
        :metric_id => 1,
        :campaign_id => 2,
        :customer_id => 3,
        :vendor_id => 4,
        :actual_score => 5,
        :total_score => 6
      ),
      MetricScore.create!(
        :metric_id => 1,
        :campaign_id => 2,
        :customer_id => 3,
        :vendor_id => 4,
        :actual_score => 5,
        :total_score => 6
      )
    ])
  end

  it "renders a list of metric_scores" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
