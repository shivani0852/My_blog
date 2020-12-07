class NewArticleMailer < ApplicationMailer
  default :from => "shivanibhati0852@gmail.com"

  def new_article_email(user)
    @user = user
    mail(to: @user.email, subject: 'Your Article is created')
  end
end
