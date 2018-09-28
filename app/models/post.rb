class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, length: { minimum: 25 }
  validates :readable_time, numericality: { greater_than: 0 }
  
  CATEGORIES = %w(events sports economy photography medicine other)
  LANGUAGES = %w(en es de)
  
  validates :category, inclusion: { in: CATEGORIES }
  validates :language, inclusion: { in: LANGUAGES }
end