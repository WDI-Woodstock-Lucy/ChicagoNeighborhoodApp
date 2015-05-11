class NeighborhoodsController < ApplicationController



  def index
   
  end

  def show
  	#NEIGHBORHOOD SELECTOR
  	id = params[:neighborhood_id] || params[:id]
  	@neighborhood = Neighborhood.find(id)

  	#RANDOM RESTAURANT SUGGESTIONS
  	location_name = @neighborhood.zipcode
  	parameters = { term: "restaurant"}
    @restaurants = Yelp.client.search(location_name, parameters)
  end



end
