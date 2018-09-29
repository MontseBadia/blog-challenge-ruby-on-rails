class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, length: { minimum: 25 }
  validates :readable_time, numericality: { greater_than: 0 }
  
  CATEGORIES = %w(events sports economy photography medicine other)
  LANGUAGES = %w(en es de)
  
  validates :category, inclusion: { in: CATEGORIES }
  validates :language, inclusion: { in: LANGUAGES }

  has_one_attached :image

  SORT_FILTER = [
    ['Newest', 'time_desc'],
    ['Oldest', 'time_asc'],
    ['Longest', 'size_long'],
    ['Shortest', 'size_short']
  ].freeze

  LANGUAGE_FILTER = %w(English Español Deutsch)

  scope :time_asc, -> { order(created_at: :asc) }
  scope :time_desc, -> { order(created_at: :desc) }
  scope :size_long, -> { order('length(body) desc') }
  scope :size_short, -> { order('length(body) asc') }
  scope :language, ->(lang) { where(language: lang) }
end