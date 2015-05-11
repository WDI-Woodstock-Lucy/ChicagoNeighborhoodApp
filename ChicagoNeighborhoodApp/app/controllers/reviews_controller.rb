class ReviewsController < ApplicationController

  def create

  end

  def destroy

  end

  private
  def reviews_params
    params.require(:review).permit(:review_body, :rating,)
  end


end
