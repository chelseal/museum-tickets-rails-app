class Listing < ApplicationRecord
  belongs_to :museum
  has_one_attached :pic, dependent: :destroy
  enum status: [ :draft, :published ]
  has_many :listings_styles
  has_many :styles, through: :listings_styles
  has_many :payments
end
