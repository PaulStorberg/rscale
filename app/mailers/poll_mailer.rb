class PollMailer < ActionMailer::Base
  default from: 'help.rscale@gmail.com'
  layout 'mailer'

  def poll_invite_email(user, poll)
    @user = user
    @poll = poll
    @url  = "#{poll_url(@poll)}"
    mail(to: @user.email, subject: 'Invitation to vote')
  end
end
