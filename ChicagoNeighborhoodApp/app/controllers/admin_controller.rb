class AdminController < ApplicationController
  # def home
  #   if @user.isAdmin
  #     # stuff for admins to see only
  #     # render stuff
  #   else
  #     #redirect to "not authorized"
  #   end
  # end

  def home
    admin_authenticate!
    @user = current_user
  end

end
