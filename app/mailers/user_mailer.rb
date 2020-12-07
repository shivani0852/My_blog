class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    attachments.inline['article1.jpeg'] = File.read("#{Rails.root}/app/assets/images/article1.jpeg")
    # email_with_name = %("#{@user.name}" <#{@user.email}>)
    mail(to: @user.email, subject: 'Welcome to My article site')
    # mail(to: email_with_name, subject: 'Welcome to My article site')
  end
end
