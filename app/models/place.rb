class Place < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true
  validates :description, presence: true
  
  mount_uploader :image, ImageUploader
end
