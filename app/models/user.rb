class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, :dob, :email, :phone_number, presence: true
  validates :email, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
end
