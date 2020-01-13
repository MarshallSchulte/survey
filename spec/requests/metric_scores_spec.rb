require 'rails_helper'

RSpec.describe "MetricScores", :type => :request do
  describe "GET /metric_scores" do
    it "works! (now write some real specs)" do
      get metric_scores_path
      expect(response).to have_http_status(200)
    end
  end
end
