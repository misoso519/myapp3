class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 50 }
  validates :bio, length: { maximum: 500 }
  validates :name, presence: true
  mount_uploader :profile_image, ProfileImageUploader
end
