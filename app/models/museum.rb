class Museum < ApplicationRecord
  belongs_to :user
  has_one_attached :pic, dependent: :destroy
  has_many :listings
end
