# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/ 

$(document).on "ajax:success","form#comments-form", (ev,data)-> 
	console.log data
	$("#comments-box").append("<p><span style='color:red'><b> #{data.user.email} </b></span> dice: 
            #{data.body} </p>")
	$("#comments-area").val("")

$(document).on "ajax:error","form#comments-form", (ev,data)->
	console.log data
