class Metric < ActiveRecord::Base
  has_many :kpis
  has_many :metric_scores
  
  belongs_to :question
  belongs_to :campaign
end
