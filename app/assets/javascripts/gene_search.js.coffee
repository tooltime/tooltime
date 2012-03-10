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
      addDropdown @, species, 'species'
    else if selected == 'Single Experiment'
      experiments = []
      $('input.experiments').each ->
        experiments.push $(@).val()
      addDropdown @, experiments, 'experiments'
    else if selected == 'Single Comparison'
      comparisons = []
      $('input.comparisons').each ->
        comparisons.push $(@).val()
      addDropdown @, comparisons, 'comparisons'
    else
      $(@).next().remove() if $(@).next().length > 0
    
  addDropdown = (element, things, paramName) ->
    html = "&nbsp;&nbsp;<select name=\"#{paramName}\">"
    html += "<option>#{thing}</option>" for thing in things
    html += "</select>"
    $(element).next().remove() if $(element).next().length > 0
    $(element).after html
      
