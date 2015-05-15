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
	var rating = $('<h4>').text(data.venue.rating);

	$(container).append($(header));
	$(container).append($(address));
	$(container).append($(phone));
	$(container).append($(rating));
	$(link).html($(container).html());
	$(listItem).append($(link));
	return listItem;
};

app.renderYelpSugg = function(data){

	var listItem = $('<li>');
	var link = $('<a>').attr("href", data.hash.url).attr("target", "_blank");
	var container = $('<div>').addClass("suggestion");
	var header = $('<h2>').text(data.hash.name);
	var address = $('<p>').text(data.hash.location.address[0]);
	var phone = $('<h3>').text(data.hash.phone);
	var rating = $('<h4>').text(data.hash.rating);

	$(container).append($(header));
	$(container).append($(address));
	$(container).append($(phone));
	$(container).append($(rating));
	$(link).html($(container).html());
	$(listItem).append($(link));
	return listItem;
};





//============================================================================SUGGESTION LIST
app.suggestions = function (){


	var clientKey = 'PFZGPZCMEIYOB1CLDVEFJXN2BBQP3CTLPDOJEMR1JPQ2A1TL';
	var clientSecret = 'WRENZBLZL5DQK3NEOGALJ1K4J0YQRE4EXHGYHDWJNAG0QEVC';
	var location = app.neighborhoodZip;
	var id = app.neighborhoodId;


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
	fourSquareCall('restaurant', app.renderFoursquareSugg, '#restaurant-suggestions');
	fourSquareCall('bar', app.renderFoursquareSugg, '#bar-suggestions');

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
	yelpCall('restaurant', app.renderYelpSugg, '#restaurant-suggestions');
	yelpCall('bar', app.renderYelpSugg, '#bar-suggestions');

	// ===============================
	// VIEWS
	// ===============================
};


//============================================================================SEARCH FUNCTION
app.searchStuff = function(){
	$('#search-submit').click(function(evt){
		evt.preventDefault();

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
			url: 'https://api.foursquare.com/v2/venues/search?client_id='+clientKey+'&client_secret='+clientSecret+'&v=20130815&near='+location+'&query='+searchTerm+'&limit=2',
			dataType: 'json',
			success: function(data){
				var data = data.response.venues;
				var result1 = data[randNum(data.length)];
				var result2 = data[randNum(data.length)];
				if(result1.name == result2.name){
					var result2 = data[randNum(data.length)];
				}
				console.log(result2);
				console.log(result1);
				$('#search-result').append(app.renderFoursquareSugg(result1));
				$('#search-result').append(app.renderFoursquareSugg(result2));
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
				$('#search-result').append(app.renderYelpSugg(result1));
				$('#search-result').append(app.renderYelpSugg(result2));
			}
		});
	});
}