class UserMailer < ActionMailer::Base
  default from: "hello@aa-music-app.com"
  
  def welcome_email(user)
    @root_text = "www.app-academy-music-app.com"
    @user = user
    @login_url = "http://localhost:3000/users/activate?user_id=#{@user.id}&token=#{@user.activate_token}"
    @url = "http://localhost:3000"
    mail(to: user.email, subject: "Welcome to the a/A music app!")
  end
  
  def reactivate_email(user)
    @root_text = "www.app-academy-music-app.com"
    @user = user
    @login_url = "http://localhost:3000/users/activate?user_id=#{@user.id}&token=#{@user.activate_token}"
    @url = "http://localhost:3000"
    mail(to: user.email, subject: "Welcome to the a/A music app!")
  end
  
end
