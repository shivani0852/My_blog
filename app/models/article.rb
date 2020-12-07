class Article < ApplicationRecord
  # config.time_zone = 'Eastern Time (US & Canada)'
  # self.per_page = 3
  has_many :comments, dependent: :destroy
  # has_one_attached :image
  has_many_attached :images
  belongs_to :user
  # after_create :send_new_article_email

  # private

  #   def send_new_article_email
  #     NewArticleMailer.new_article_email(self).deliver_now
  #   end
end
