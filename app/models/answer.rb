class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :likes, as: :likeable, dependent: :destroy

  mount_uploader :image, AnswerImageUploader
  mount_uploader :video, AnswerVideoUploader

  validates :body, presence: true
end
