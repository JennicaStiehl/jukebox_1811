class AwardsController < ApplicationController
  def index
    @awards = Award.all
    @top3 = Award.top_3
  end

  def show
    @award = Award.find(params[:id])

  end
end
