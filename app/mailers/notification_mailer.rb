class NotificationMailer < ActionMailer::Base
  default from: "no-reply@welp.com"
  
  def comment_added
    mail(to: 'poodle.fury@gmail.com', subject: 'A comment has been added to your place')
  end
  
end