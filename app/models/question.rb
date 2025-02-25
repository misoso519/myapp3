class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers, dependent: :destroy

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  validates :title, presence: true
  validates :body, presence: true

  scope :search, ->(query) {
    where("title ILIKE ? OR body ILIKE ?", "%#{query}%", "%#{query}%") if query.present?
  }
  end
end
