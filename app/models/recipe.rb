class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :recipefoods, foreign_key: :recipe_id, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true

end
