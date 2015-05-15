class AdminController < ApplicationController

  def home
    admin_authenticate!
    @users = User.all
    @user = current_user
    @neighborhood = params[:id] ? Neighborhood.find(params[:id]) : Neighborhood.new
    @neighborhoods = Neighborhood.all
  end

end
