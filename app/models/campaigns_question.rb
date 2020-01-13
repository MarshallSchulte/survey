class CampaignsQuestion < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :question
end