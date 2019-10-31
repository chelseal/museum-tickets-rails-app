class Style < ApplicationRecord
    has_many :listings_styles
    has_many :listings, through: :listings_styles
end
