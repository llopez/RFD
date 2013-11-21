class Comment < ActiveRecord::Base
  belongs_to :place
  validates :body, presence: true, length: {minimum: 5, if: "body.present?"}
  validates :place, presence: true
end
