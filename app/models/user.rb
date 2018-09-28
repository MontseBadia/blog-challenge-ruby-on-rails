class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  has_secure_password

  validates :name, presence: true
  validates :email, format: /\A\S+@\S+\z/, uniqueness: { case_sensitive: false }
end