class Api::PartiesController < ApplicationController
  def index
    @parties = Party.all
    render :index
  end

  def show
    @party = Party.find(params[:id])
    render :show, include: { guests: { include: :gifts } }
  end
end
