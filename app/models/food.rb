class Food < ApplicationRecord
  belongs_to :user,foreign_key: :user_id
  has_many :recipefoods, foreign_key: :food_id

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
end
