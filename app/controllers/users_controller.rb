class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      user = User.create(user_params)
      redirect_to '/'
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
      params.require(:user).permit(:password, :email, :is_admin)
    end

    def profile
      #Locate profile user
      authenticate!
      @user = current_user
      @useredit = User.new
    end

    def update_prof
      #Make changes to profile (add, subtract saved)
      @user_update_email = @user.update(:email)
      @user_update_password = @user.update(:password)
      user_update_email.save!
      user_update_password.save!

      # id = @user.find(params[:primary_key_id])
      # email_change = User.find(primary_key_id).edit(:email)
      # password_change = User.find(primary_key_id).edit(:password)
    end

    def render_prof_reviews
      # #Review info - to create, to get all previous reviews and to post
      # all_reviews = @review.index
      # new_review = @review.create
      # delete_review = @review.destroy
    end
end
