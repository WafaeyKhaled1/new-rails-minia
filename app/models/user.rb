class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :created_posts, class_name: "Post", foreign_key: :user_id, dependent: :destroy

  validates :name, :dob, :email, :phone_number, presence: true
  validates :email, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
end
