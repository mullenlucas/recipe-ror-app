class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :recipefoods, foreign_key: :food_id, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
end
