class UserMailer < ActionMailer::Base
  default from: 'user@appacademy.io'


  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: 'njvizzutti@gmail.com', subject: 'Welcome to 99Cats')
  end
end
