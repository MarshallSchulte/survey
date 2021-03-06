class SurveyMailer < ActionMailer::Base
  default from: "panceptionmailers@gmail.com"
  def survey_email(reviewer)
    @reviewer = reviewer
    #mail(to: 'pranab.khanal@gmail.com', subject: 'Sample Email')
    mail(to: reviewer.email, subject: 'Sample Email')
  end
  
  def vendor_email
    @admins = User.all.each do |u|
      if u.roles.first.id == 1
        @u = u
        mail(to: @u.email, subject: 'New Vendor Created')
      end
    end
  end
  
  def powerpoint_email(user, campaign)
    @user = user
    @campaign = campaign
    mail.attachments["#{@campaign.name}.pptx"] = File.read("public/#{@user.name}/#{@campaign.name}.pptx")
    mail(to: @user.email, subject: "Your Panception Powerpoint")
  end
end
