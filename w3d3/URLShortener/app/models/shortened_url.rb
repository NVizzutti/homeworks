# require 'SecureRandomreload'
class ShortenedUrl < ActiveRecord::Base
  include SecureRandom
  validates :user_id, presence: true
  validates :long_url, :short_url, presence: true, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :visitor

  def self.random_code
    SecureRandom.urlsafe_base64
  end

  def self.create_for_user_and_long_url!(user, long_url)
    user_id = user.id
    short_url = ShortenedUrl.random_code
    ShortenedUrl.new(user_id: user_id, long_url: long_url, short_url: short_url)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.select(:id).distinct.count
  end

  def num_recent_uniques
    recent = 10.minutes.ago
    self.visits.select(:visitor_id).where("created_at > ?", recent).distinct.count
  end
  # def initialize(long_url, user_id)
  #   @long_url = long_url
  #   @user_id = user_id
  #   # @short_url = ShortenedUrl.random_code
  #   until self.valid?
  #     @short_url = ShortenedUrl.random_code
  #   end
  # end
end
