class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl

  has_many :visits,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :Visit

  has_many :visited_urls,
    through: :visits,
    source: :visited_url

  has_many :visitors_to_submitted_urls,
    through: :submitted_urls,
    source: :visitors
end
