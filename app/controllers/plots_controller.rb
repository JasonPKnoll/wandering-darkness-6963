class PlotsController < ApplicationController

  def index
    @plots = Plot.all
  end

  def delete

  end

end
