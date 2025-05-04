class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :likes, as: :likeable, dependent: :destroy

  mount_uploader :image, AnswerImageUploader
  mount_uploader :video, AnswerVideoUploader

  validates :body, presence: true
  after_create_commit :create_notification

  private

  def create_notification
    return if question.user == user # 自分の投稿に対するコメントは通知しない

    Notification.create!(
      user: question.user,
      notifiable: self,
      message: "#{user.name} さんがあなたの投稿にコメントしました"
    )
  end
end
