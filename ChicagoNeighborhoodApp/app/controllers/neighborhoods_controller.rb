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
    restaurants = results.businesses
    @restaurant = restaurants.sample
  end

  def create
    User.create
  end


end
