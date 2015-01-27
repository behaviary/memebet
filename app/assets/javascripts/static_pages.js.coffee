# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  clicks = 0
  $(".meme").on "click", ->
    clicks += 1
    $(".bets").text click