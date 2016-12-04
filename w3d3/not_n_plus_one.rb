# app/models/track.rb
class Track
   belongs_to(
    :album,
    class_name: "Album",
    foreign_key: :album_id,
    primary_key: :id
  )
end


# app/models/album.rb
class Album
  belongs_to(
    :artist,
    class_name: "Artist",
    foreign_key: :artist_id,
    primary_key: :id
  )

  has_many(
    :tracks,
    class_name: "Track",
    foreign_key: :album_id,
    primary_key: :id
  )
end


# app/models/artist.rb
class Artist
  has_many(
    :albums,
    class_name: "Album",
    foreign_key: :artist_id,
    primary_key: :id
  )

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.name] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    albums = self.albums.includes(:tracks, :name)
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.name] = album.tracks.length
    end
  end
end

class Gardener
  belongs_to(
    :house,
    class_name: "House",
    foreign_key: :house_id,
    primary_key: :id
  )

  has_many(
    :plants,
    class_name: "Plant",
    foreign_key: :gardener_id,
    primary_key: :id
  )
end


# app/models/plant.rb
class Plant
  belongs_to(
    :gardener,
    class_name: "Gardener",
    foreign_key: :gardener_id,
    primary_key: :id
  )

  has_many(
    :seeds,
    class_name: "Seed",
    foreign_key: :plant_id,
    primary_key: :id
  )
end



# app/models/seed.rb
class Seed
  belongs_to(
    :plant,
    class_name: "Plant",
    foreign_key: :plant_id,
    primary_key: :id
  )
end


# app/models/house.rb
class House
  has_many(
    :gardeners,
    class_name: "Gardener",
    foreign_key: :house_id,
    primary_key: :id
  )

  has_many(
    :plants,
    through: :gardeners,
    source: :plants
  )

  def n_plus_one_seeds
    plants = self.plants
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end

  def better_seeds_query
    plants = self.plants.includes(:seeds)
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end
    seeds 
  end
end
