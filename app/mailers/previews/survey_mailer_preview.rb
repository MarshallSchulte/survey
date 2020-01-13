# Preview all emails at http://localhost:3000/rails/mailers/example_mailer
class SurveyMailerPreview < ActionMailer::Preview
  def survey_mail_preview
    SurveyMailer.survey_email(Reviewer.first)
  end
end