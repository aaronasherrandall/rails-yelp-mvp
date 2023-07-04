class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  # define a constant for the list of valid categories
  VALID_CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

  # add validations here
  validates :name, :address, :category, presence: true
  validates :category, presence: true, inclusion: { in: VALID_CATEGORIES, message: "%{value} us not a valid category" }
end
