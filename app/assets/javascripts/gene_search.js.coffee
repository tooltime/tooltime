# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#add-factor-btn').click ->
    sources = $(@).prev().attr 'data-source'
    $(@).before '<input name="tfactors[]" type="text" data-provide="typeahead" />'
    $(@).prev().attr 'data-source', sources
    false
  
  $('.scope.controls select').change ->
    selected = $(@).val()
    if selected == 'Single Specie'
      species = []
      $('input.species').each ->
        species.push $(@).val()
      html = "&nbsp;&nbsp;<select>"
      html += "<option>#{specie}</option>" for specie in species
      html += "</select>"
      $(@).after html
    else if selected == 'Single Experiment'
      # TODO
    else if selected == 'Single Comparison'
      # TODO
    else
      # TODO
