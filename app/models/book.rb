class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :categories
  has_one :cover_image, class_name: 'Image', as: :imageable, dependent: :destroy

  validates :title, presence: true
  validates :isbn, presence: true, uniqueness: true, format: { with: /\A\d{3}-\d{10}\z/ }
end
