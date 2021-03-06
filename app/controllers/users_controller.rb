class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      user = User.create!(user_params)
      session[:user_id] = user.id
      redirect_to '/'
    end

    def update
      user = User.find(params[:id])
      user.update!(user_params)
      redirect_to "/admin"
    end

    def show
      @user = User.find(params[:id])
    end

    def destroy
      User.destroy(params[:id])
      redirect_to "/admin"
    end

    def profile
      #Locate profile user
      authenticate!
      @user = current_user
      @newuser = User.new
      @useredit = User.new
    end

    def update_prof
      authenticate!
      @user = current_user
      puts params
      email = params[:email].to_s
      password = params[:password].to_s
      @user.email = email
      @user.password = password
      @user.save! ## is creating new entry... current_user is undefined
    end

    # def render_prof_reviews
    #   # #Review info - to create, to get all previous reviews and to post
    #   all_reviews = @review.index
    #   new_review = @review.create
    #   delete_review = @review.destroy
    # end

    private

    def user_params
      params.require(:user).permit(:password, :email, :is_admin)
    end

end
