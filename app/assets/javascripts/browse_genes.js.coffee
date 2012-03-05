# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#filter-la-modal .one-value .btn-primary').click ->
    $('#filter-la-modal .one-value').submit()
  $('#filter-la-modal .range .btn-primary').click ->
    $('#filter-la-modal .range').submit()
  
  $('#filter-laslash-modal .one-value .btn-primary').click ->
    $('#filter-laslash-modal .one-value').submit()
  $('#filter-laslash-modal .range .btn-primary').click ->
    $('#filter-laslash-modal .range').submit()
  
  $('#filter-lq-modal .one-value .btn-primary').click ->
    $('#filter-lq-modal .one-value').submit()
  $('#filter-lq-modal .range .btn-primary').click ->
    $('#filter-lq-modal .range').submit()
  
  $('#filter-ld-modal .one-value .btn-primary').click ->
    $('#filter-ld-modal .one-value').submit()
  $('#filter-ld-modal .range .btn-primary').click ->
    $('#filter-ld-modal .range').submit()
  
  $('#filter-location-modal .btn-primary').click ->
    $('#filter-location-modal form').submit()
