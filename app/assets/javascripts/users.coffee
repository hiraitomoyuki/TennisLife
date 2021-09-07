# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#user_postal_code').jpostal({
		postcode : ["#user_postal_code"],
		address  : {
						"#user_prefecture_code" : "%3",
						"#user_address"    : "%4%5%6",
		}
	})