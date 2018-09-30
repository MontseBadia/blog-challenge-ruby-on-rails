class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :fav_posts, through: :likes, source: :post


  has_secure_password

  validates :name, presence: true
  validates :email, format: /\A\S+@\S+\z/, uniqueness: { case_sensitive: false }

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
end