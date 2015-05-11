require 'yelp'


#Creates a Global Client to access Yelp Searches (***client.search(params)***)
Yelp.client.configure do |config|
  config.consumer_key = "ssv6jSv0meS19vC_Cw85Ag"
  config.consumer_secret = "vO3ndashYEanbDNFsfuFWjTdk1U"
  config.token = "TOhnCtlQR4sWmchYf4_iR-yyn4g8CSDi"
  config.token_secret = "JuHkqjT0e1oZlkjWkf5Emqf0RoA"
end