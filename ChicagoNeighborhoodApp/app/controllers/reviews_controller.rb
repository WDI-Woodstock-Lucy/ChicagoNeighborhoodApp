class ReviewsController < ApplicationController

  def create
    authenticate!
    current_user.reviews << Review.create(review_params)
    redirects to '/profile'
  end

  def destroy
    Review.destroy(params[:id])
    redirect_to '/profile'
  end

  private
  def review_params
    params.require(:review).permit(:review_body, :rating,)
  end


end
