class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :reviewer
  belongs_to :campaign
  
  validates :reviewer_id, uniqueness: true, if: :survey_is_sent?
  
  def survey_is_sent?
    if Reviewer.find(self.reviewer_id).survey_complete == true
      return true
    end
  end
  
  def answer_comment?
    if self.answer_option == 1 || 2 || 7
      return true
    end
  end
end
