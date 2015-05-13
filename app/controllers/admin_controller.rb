class AdminController < ApplicationController

  def home
    admin_authenticate!
    @user = current_user
    @neighborhood = Neighborhood.new
    @neighborhoods = Neighborhood.all
  end

  def create
    @neighborhood = Neighborhood.create
    redirect_to '/admin'
  end

  def update
    @neighborhood.find(params[:id])
    @neighborhood.update!(neighborhood_params)
  end

  def destroy
    Neighborhood.destroy(params[:id])
  end

  private
  def neighborhood_params
    params.require(:neighborhood).permit(:name, :description, :zipcode)
  end


end
