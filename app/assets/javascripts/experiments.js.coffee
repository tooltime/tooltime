# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# submits the filter form when the filter button is pressed
$ ->  
  $('#filter-experiments-modal .btn-primary').click ->
    $('#filter-experiments-modal form').submit()
