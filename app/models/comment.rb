class Comment < ActiveRecord::Base
  belongs_to :place
  belongs_to :author, class_name: 'User'
  validates :body, presence: true, length: {minimum: 5, if: "body.present?"}
  validates :place, presence: true
  validates :author, presence: true

  default_scope -> { order('created_at DESC') }
end
