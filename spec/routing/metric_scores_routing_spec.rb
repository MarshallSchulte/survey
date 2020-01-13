require "rails_helper"

RSpec.describe MetricScoresController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/metric_scores").to route_to("metric_scores#index")
    end

    it "routes to #new" do
      expect(:get => "/metric_scores/new").to route_to("metric_scores#new")
    end

    it "routes to #show" do
      expect(:get => "/metric_scores/1").to route_to("metric_scores#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/metric_scores/1/edit").to route_to("metric_scores#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/metric_scores").to route_to("metric_scores#create")
    end

    it "routes to #update" do
      expect(:put => "/metric_scores/1").to route_to("metric_scores#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/metric_scores/1").to route_to("metric_scores#destroy", :id => "1")
    end

  end
end
