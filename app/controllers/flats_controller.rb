class FlatsController < ApplicationController

  before_action :find_flat, only: [:show, :edit, :destroy]

  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.new
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def find_flat
    @flat = Flat.find(params[:id].to_i)
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

end
