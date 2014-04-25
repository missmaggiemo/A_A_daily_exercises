class UserMailer < ActionMailer::Base
  default from: "hello@aa-music-app.com"
  
  def welcome_email(user)
    @user = user
    @login_url = "http://www.app-academy-music-app.com/session/new"
    @url = "http://www.app-academy-music-app.com"
    mail(to: user.email, subject: "Welcome to the a/A music app!")
  end
  
end
