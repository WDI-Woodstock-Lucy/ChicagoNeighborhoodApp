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
      #Locate profile user
      authenticate!
      @user = current_user
      @newuser = User.new
      @useredit = User.new
    end

    def update_prof
      @user = current_user
      puts params
      email = params[:email].to_s
      password = params[:password].to_s
      @user.email = email
      @user.password = password
      @user.save! ## is creating new entry... current_user is undefined

      #Edit email and password
      #@user_update_email = @user.update(:email)
      #@user_update_password = @user.update(:password)
      #user_update_email.save
      #user_update_password.save

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

    private

    def user_params
      params.require(:user).permit(:password, :email, :is_admin)
    end

end
