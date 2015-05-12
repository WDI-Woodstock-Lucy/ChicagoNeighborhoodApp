class NeighborhoodsController < ApplicationController

  def index
    @user = User.new
  end

  def show
  	#NEIGHBORHOOD SELECTOR
  	id = params[:neighborhood_id] || params[:id]
  	@neighborhood = Neighborhood.find(id)

  	#RANDOM RESTAURANT SUGGESTIONS
  	location_name = @neighborhood.zipcode
  	parameters = { term: "restaurant"}
    results = Yelp.client.search(location_name, parameters)
    @restaurants = results.businesses.sample(3)

    #RANDOM BAR SUGGESTIONS
    location_name = @neighborhood.zipcode
    parameters = { term: "bar"}
    results = Yelp.client.search(location_name, parameters)
    @bars = results.businesses.sample(3)

  end

  def search
    id = params[:neighborhood_id] || params[:id]
  	@neighborhood = Neighborhood.find(id)
    location = @neighborhood.name
    search_term = {term: params[:term]}
    search_result = Yelp.client.search(location, search_term)
    @results = search_result.businesses
  end

  def create
    User.create
  end

  def profile
    #Locate profile user
    profile_user = params[:username, :password]
    @user = User.find(username, password)

    #Get profile information (saved attractions lists and list of submitted reviews)
    saved_info = params[:favorite_id]
    @favorite = Favorite.find(favorite_id)

    @review = Review.find(params(busines))

    #Make changes to profile (add, subtract saved)

    profile_use
    profile_location = User.
  end


end
