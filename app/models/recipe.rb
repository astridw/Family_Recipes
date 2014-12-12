class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :directions
  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :directions, :reject_if => :all_blank, :allow_destroy => true
  has_attached_file :image,
                    styles: {medium: "600x600#",thumb: "300x300#"},
                    :default_url => "/assets/:medium/missing_avatar.gif"
  validates_attachment_content_type :image, :content_type => /\Aimage/
  has_attached_file :attach
  validates :title, :description, :image, presence: true
  include PgSearch
  pg_search_scope :search,
  against: [:title, :description, :make_recipe_date],
  using: {
    tsearch: {dictionary: "english"}
  }
  acts_as_taggable

  def to_ics
    event = Icalendar::Event.new
    event.dtstart = Icalendar::Values::Date.new self.make_recipe_date.beginning_of_day
    event.dtend = Icalendar::Values::Date.new self.make_recipe_date.end_of_day
    event.summary = self.title
    event.description = self.description
    # event.location = 'Here !'
    event.ip_class = "PUBLIC"
    event.created = self.created_at
    event.last_modified = self.updated_at
    event
  end

  def end_time
    make_recipe_date.strftime("%Y%m%dT") + self.end.to_datetime.strftime("%H%M%S")
  end
end
