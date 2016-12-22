class BandsController < ApplicationController
  def show
    @band = Band.find(params[:id])
  end

  def new
    @bands = Band.all
  end


end
