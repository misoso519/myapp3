class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers, dependent: :destroy

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  validates :title, presence: true
  validates :body, presence: true
  
  def self.search(query)
    if query.present?
      where("title LIKE :query OR body LIKE :query", query: "%#{query}%")
    else
      all
    end
  end
end
