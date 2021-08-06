class PlantsController < ApplicationController

  def show
  end

  def destroy
    @plot = Plot.find(params[:plot_id])
    @plant = Plant.find(params[:id])
    @plot.plants.destroy(@plant)
    redirect_to plots_path
  end

end
