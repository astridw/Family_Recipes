class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  include PgSearch
  pg_search_scope :search,
  against: [:title, :description, :ingredients, :make_recipe_date],
  using: {
    tsearch: {dictionary: "english"}
  }
end
