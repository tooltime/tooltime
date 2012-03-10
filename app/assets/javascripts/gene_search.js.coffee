# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#add-factor-btn').click ->
    sources = $(@).prev().attr 'data-source'
    $(@).before '<input name="tfactors[]" type="text" data-provide="typeahead" />'
    $(@).prev().attr 'data-source', sources
    false
