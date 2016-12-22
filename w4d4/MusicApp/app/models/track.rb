class Track < ActiveRecord::Base
  validates :song, :album_id, presence: true

  belongs_to :album
end
