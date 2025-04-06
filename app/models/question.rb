class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  validates :title, presence: true
  validates :body, presence: true

  def self.search(query)
    where("title LIKE ? OR body LIKE ?", "%#{query}%", "%#{query}%")
  end
end
