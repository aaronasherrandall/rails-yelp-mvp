class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  # define a constant for the list of valid categories
  VALID_CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

  10.times do
    restaurant = Restaurant.create!(
      name: Faker::Restaurant.name,
      address: Faker::Address.street_address,
      phone_number: Faker::PhoneNumber.phone_number,
      category: VALID_CATEGORIES.sample # randomly pick one of the categories
    )
  end

  # add validations here
  validates :name, :address, :category, presence: true
  validates :category, presence: true, inclusion: { in: VALID_CATEGORIES, message: "%{value} us not a valid category" }
end
