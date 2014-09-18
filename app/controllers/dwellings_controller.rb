class DwellingsController < ApplicationController
  def new
    @dwelling = Dwelling.new
  end

  def create
    @dwelling = Dwelling.new(dwelling_params)
    if @dwelling.save
      redirect_to action: 'show', id: @dwelling.id
    else
      flash.now[:error] = "sorry that didn't save. Try again"
      render 'new'
    end
  end

  def show
    @dwelling = Dwelling.find(params[:id])
  end

  def edit
    @dwelling = Dwelling.find(params[:id])
  end

  def update
    @dwelling = Dwelling.find(params[:id])
    @dwelling.attributes = dwelling_params
    if @dwelling.save
      redirect_to action: "show", id: @dwelling.id
    else

    end
  end

  def dwelling_params
    params.require(:dwelling).permit(:name, :address)
  end


end

