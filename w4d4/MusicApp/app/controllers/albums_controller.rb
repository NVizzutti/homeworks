class AlbumsController < ApplicationController
  def new
    @band = Band.find(params[:id])
    @albums = @band.albums
  end
end
