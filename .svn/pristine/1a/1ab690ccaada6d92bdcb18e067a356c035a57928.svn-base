class Question < ActiveRecord::Base
  #has_and_belongs_to_many :campaigns
  has_and_belongs_to_many :campaigns, join_table: :campaigns_questions
  accepts_nested_attributes_for :campaigns
  has_one :metric
  has_many :responses
  accepts_nested_attributes_for :responses
end
