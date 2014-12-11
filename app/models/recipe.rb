class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :directions
  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :directions, :reject_if => :all_blank, :allow_destroy => true
  has_attached_file :image, styles: {medium: "600x600#",thumb: "300x300#"}
  validates_attachment_content_type :image, :content_type => /\Aimage/
  validates :title, :description, :image, presence: true
  include PgSearch
  pg_search_scope :search,
  against: [:title, :description, :make_recipe_date],
  using: {
    tsearch: {dictionary: "english"}
  }
end
