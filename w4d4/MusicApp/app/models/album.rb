class Album < ActiveRecord::Base
  validates :title, :band_id, presence: true

  belongs_to :band,
  primary_key: :id,
  foreign_key: :band_id,
  class_name: :Band

  has_many :tracks
end
