class AdminController < ApplicationController

  def home
    admin_authenticate!
    @users = User.all
    @user = current_user
    @neighborhood = params[:id] ? Neighborhood.find(params[:id]) : Neighborhood.new
    @neighborhoods = Neighborhood.all
  end

  def update
    neighborhood = Neighborhood.find(params[:id])
    neighborhood.update!(neighborhood_params)
    redirect_to '/admin'
  end

  private
  def neighborhood_params
    params.require(:neighborhood).permit(:name, :description, :zipcode)
  end

end
