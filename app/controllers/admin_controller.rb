class AdminController < ApplicationController

  def home
    admin_authenticate!
    @user = current_user
    @neighborhood = params[:id] ? Neighborhood.find(params[:id]) : Neighborhood.new
    @neighborhoods = Neighborhood.all
  end

  def create
    @neighborhood = Neighborhood.create
    redirect_to '/admin'
  end

  def update
    neighborhood = Neighborhood.find(params[:id])
    neighborhood.update!(neighborhood_params)
    redirect_to '/admin'
  end

  def destroy
    Neighborhood.destroy(params[:id])
    redirect_to '/admin'
  end

  private
  def neighborhood_params
    params.require(:neighborhood).permit(:name, :description, :zipcode)
  end


end
