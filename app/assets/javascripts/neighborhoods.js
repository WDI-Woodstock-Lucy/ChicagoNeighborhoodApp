// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
console.log("...Main JS is loaded...");
var app = app || {};


//=======================RANDOM NUMBER GENERATOR
function randNum(num){
	return Math.floor(Math.random() * num);
}


//============================================================================RENDERING FUNCTIONS

//FOUR SQUARE
app.renderFoursquareSugg = function(data){

	var listItem = $('<li>');
	var link = $('<a>').attr("href", data.tips[0].canonicalUrl).attr("target", "_blank");
	var container = $('<div>').addClass("suggestion");
	var header = $('<h2>').text(data.venue.name);
	var address = $('<p>').text(data.venue.location.address);
	var phone = $('<h3>').text(data.venue.contact.formattedPhone);
	var rating = $('<h3>').text('Rating: ' + data.venue.rating + ' / 10').addClass('rating');

	$(container).append($(header));
	$(container).append($(address));
	$(container).append($(phone));
	$(container).append($(rating));
	$(link).html($(container).html());
	$(listItem).append($(link)).addClass('fadeInDown');
	return listItem;
};

app.renderYelpSugg = function(data){

	var listItem = $('<li>');
	var link = $('<a>').attr("href", data.hash.url).attr("target", "_blank");
	var container = $('<div>').addClass("suggestion");
	var header = $('<h2>').text(data.hash.name);
	var address = $('<p>').text(data.hash.location.address[0]);
	var phone = $('<h3>').text(data.hash.display_phone);
	var rating = $('<h3>').text('Rating: ' +data.hash.rating + " / 5").addClass('rating');

	$(container).append($(header));
	$(container).append($(address));
	$(container).append($(phone));
	$(container).append($(rating));
	$(link).html($(container).html());
	$(listItem).append($(link)).addClass('fadeInDown');;
	return listItem;
};



//============================================================================SUGGESTION LIST
app.suggestions = function (){


	var clientKey = 'PFZGPZCMEIYOB1CLDVEFJXN2BBQP3CTLPDOJEMR1JPQ2A1TL';
	var clientSecret = 'WRENZBLZL5DQK3NEOGALJ1K4J0YQRE4EXHGYHDWJNAG0QEVC';
	var location = app.neighborhoodZip;
	var id = app.neighborhoodId;

// //====================WalkScore_Rendering_Function
// app.transitInfo = function (){
// 	var clientKey = '2bd02fc7cb6ce1f6764b4a37008f5411';
// 	var walkScore = wsiapikey.walkscore;
// 	var walkScoreDesc = wsiapikey.walkscore;
// 	var description = wsiapikey.description;
//
// }
//
//
//
// reverse_geocoded_by :latitude, :longitude
// after_validation :reverse_geocode  # auto-fetch address


	// ===============================
	// FOURSQUARE
	// ===============================
	function fourSquareCall(query, callback, place){
		var query = query;
		var $place = $(place);
		$.ajax({
			method: 'get',
			url: 'https://api.foursquare.com/v2/venues/explore?client_id='+clientKey+'&client_secret='+clientSecret+'&v=20130815&near='+location+'&query='+query+'&limit=10',
			dataType: 'json',
			success: function(data){
				var data = data.response.groups[0].items;
				var result1 = data[randNum(data.length)];
				var result2 = data[randNum(data.length)];
				if(result1.name == result2.name){
					var result2 = data[randNum(data.length)];
				}
				
				$place.append(callback(result1));
				$place.append(callback(result2));

			}
		});
	};
	//======CALLS FOR RESTAURANTS & BARS
	fourSquareCall('restaurant', app.renderFoursquareSugg, '#foursquare-restaurants');
	fourSquareCall('bar', app.renderFoursquareSugg, '#foursquare-bars');

	//===============================
	// YELP
	// ===============================
	function yelpCall(query, callback, place){
		var query = query;
		var $place = $(place);
		$.ajax({
			method: 'get',
			url: '/search/' + id,
			dataType: 'json',
			data: {term: query},
			success: function(data){
				var data = data;
				var result1 = data[randNum(data.length)];
				var result2 = data[randNum(data.length)];
				if(result1.name == result2.name){
					var result2 = data[randNum(data.length)];
				}
				$place.append(callback(result1));
				$place.append(callback(result2));
			}
		});
	};
	//======CALLS FOR RESTAURANTS & BARS
	yelpCall('restaurant', app.renderYelpSugg, '#yelp-restaurants');
	yelpCall('bar', app.renderYelpSugg, '#yelp-bars');

	// ===============================
	// VIEWS
	// ===============================
};


//============================================================================SEARCH FUNCTION
app.searchStuff = function(){
	$('#search-submit').click(function(evt){
		evt.preventDefault();
		$('#yelp-results').empty();
		$('#foursquare-results').empty();
		var clientKey = 'PFZGPZCMEIYOB1CLDVEFJXN2BBQP3CTLPDOJEMR1JPQ2A1TL';
		var clientSecret = 'WRENZBLZL5DQK3NEOGALJ1K4J0YQRE4EXHGYHDWJNAG0QEVC';
		var location = app.neighborhoodZip;
		var id = app.neighborhoodId;

		var searchTerm = $('#search-field').val();
		//======================================================
		//		FOURSQUARE SEARCH
		//======================================================
		$.ajax({
			method: 'get',
			url: 'https://api.foursquare.com/v2/venues/explore?client_id='+clientKey+'&client_secret='+clientSecret+'&v=20130815&near='+location+'&query='+searchTerm+'&limit=2',
			dataType: 'json',
			success: function(data){
				console.log(data);
				var data = data.response.groups[0].items;
				for(var i = 0; i < 2; i++){
					//if(data.venue.rating.parseFloat() >= 9){
						var result = data[i];
						$('#foursquare-results').append(app.renderFoursquareSugg(result));
					//}
				};
			}
		});

		//======================================================
		//		YELP SEARCH
		//======================================================
		$.ajax({
			method: 'get',
			url: '/search/' + id,
			dataType: 'json',
			data: {term: searchTerm},
			success: function(data){
				var data = data;
				var result1 = data[randNum(data.length)];
				var result2 = data[randNum(data.length)];
				if(result1.name == result2.name){
					var result2 = data[randNum(data.length)];
				}
				$('#yelp-results').append(app.renderYelpSugg(result1));
				$('#yelp-results').append(app.renderYelpSugg(result2));
			}
		});
	});
}
