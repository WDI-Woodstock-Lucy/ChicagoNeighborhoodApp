class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def create
    @favorite = Favorite.create(favorite_params)
    favorite.user = current_user
    favorite.save!
    redirect_to "/profile" #check that the routing is consistent when finished with model and routing documentation
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def destroy
    Favorite.destroy(params[:id])
    redirect_to "/profile"
  end

  private

  def favorite_params
    params.require(params[:favorite]).permit(:business_name)
  end
end
