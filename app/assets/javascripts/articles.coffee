# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
	$("#article-tags").tagit
		fieldName:     'article[tag_list]'
		singleField:   true
		availableTags: gon.available_tags


	
	if gon.article_tags?
    	for tag in gon.article_tags
    		$("#article-tags").tagit 'createTag', tag
    