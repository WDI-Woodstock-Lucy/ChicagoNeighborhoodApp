class UsersController < ApplicationController
  def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def edit
      user = User.create(user_params)
      redirect_to "/users/#{user_id}"
    end

    def update
      user = User.find(params[:id])
      user.update!(user_params)
      redirect_to "/users/#{user_id}"
    end

    def show
      @user = User.find(params[:id])
    end

    def destroy
      User.destroy(params[:id])
      redirect_to "/users"
    end

    def profile
      authenticate!
      @user = current_user
      @review = Review.new
    end

    private

    def user_params
      params.require(:user).permit(:primary_key_id, :username, :password_digest, :email)
    end
end
