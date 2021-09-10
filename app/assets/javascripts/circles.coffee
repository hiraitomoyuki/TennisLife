# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#circle_postcode').jpostal({
		postcode : ["#circle_postcode"],
		address  : {
						"#circle_prefecture_code" : "%3",
						"#circle_address"    : "%4%5%6%7",
		}
	})