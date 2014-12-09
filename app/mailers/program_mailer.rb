class ProgramMailer < ActionMailer::Base
  default from: "from@example.com"

  def program_mailer(user)
    mail(:to => user.email,
         :subject => 'Your Recommended Programs' )
  end
end
