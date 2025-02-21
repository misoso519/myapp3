class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  mount_uploader :image, AnswerImageUploader
  mount_uploader :video, AnswerVideoUploader

  validates :body, presence: true
end
