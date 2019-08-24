class UserMailer < ApplicationMailer
    default from: 'mmageca36.af@gmail.com'
 
    def welcome_email
      @user = params[:user]
      @url  = 'https://bit.ly/33uhx9G'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end
