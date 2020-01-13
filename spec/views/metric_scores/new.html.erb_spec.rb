require 'rails_helper'

RSpec.describe "metric_scores/new", :type => :view do
  before(:each) do
    assign(:metric_score, MetricScore.new(
      :metric_id => 1,
      :campaign_id => 1,
      :customer_id => 1,
      :vendor_id => 1,
      :actual_score => 1,
      :total_score => 1
    ))
  end

  it "renders new metric_score form" do
    render

    assert_select "form[action=?][method=?]", metric_scores_path, "post" do

      assert_select "input#metric_score_metric_id[name=?]", "metric_score[metric_id]"

      assert_select "input#metric_score_campaign_id[name=?]", "metric_score[campaign_id]"

      assert_select "input#metric_score_customer_id[name=?]", "metric_score[customer_id]"

      assert_select "input#metric_score_vendor_id[name=?]", "metric_score[vendor_id]"

      assert_select "input#metric_score_actual_score[name=?]", "metric_score[actual_score]"

      assert_select "input#metric_score_total_score[name=?]", "metric_score[total_score]"
    end
  end
end
