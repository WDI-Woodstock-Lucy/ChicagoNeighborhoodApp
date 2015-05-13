class NeighborhoodsController < ApplicationController

  def index
    @newuser = User.new
    @user = current_user
  end

  def create
    @neighborhood = Neighborhood.create(neighborhood_params)
    redirect_to '/admin'
  end


  def api_yelp
    id = params[:neighborhood_id] || params[:id]
    @neighborhood = Neighborhood.find(id)
    location = @neighborhood.name
    search_term = {term: params[:term]}
    search_result = Yelp.client.search(location, search_term)
    @results = search_result.businesses
  end

  def show
    @newuser = User.new
    @user = current_user
  	#NEIGHBORHOOD SELECTOR
  	id = params[:neighborhood_id] || params[:id]
  	@neighborhood = Neighborhood.find(id)

  	#RANDOM RESTAURANT SUGGESTIONS
  	location_name = @neighborhood.zipcode
  	parameters = { term: "restaurant"}
    results = Yelp.client.search(location_name, parameters)
    @restaurants = results.businesses.sample(2)

    #RANDOM BAR SUGGESTIONS
    location_name = @neighborhood.zipcode
    parameters = { term: "bar"}
    results = Yelp.client.search(location_name, parameters)
    @bars = results.businesses.sample(2)

  end

  def search
    id = params[:neighborhood_id] || params[:id]
  	@neighborhood = Neighborhood.find(id)
    location = @neighborhood.name
    search_term = {term: params[:term]}
    search_result = Yelp.client.search(location, search_term)
    @results = search_result.businesses
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
