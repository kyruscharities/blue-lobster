class ProgramMailer < ActionMailer::Base
  default from: "automated@checkpointmarshall.com"

  def program_mailer(user)
    @user = user
    mail(:to => user.email,
         :subject => 'Your Recommended Job Types' )
  end
end
