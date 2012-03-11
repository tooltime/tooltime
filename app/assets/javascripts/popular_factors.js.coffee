# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#select-comparisons-btn').click ->
    selectedSpecies = ($(element).val() for element in $('input.[name="species[]"]'))
    $('#select-comparisons input[type="checkbox"]').each ->
      if $.inArray($(@).val(), selectedSpecies) == -1
        $(@).parent().remove()
      
  $('#select-experiments-btn').click ->
    selectedExperiments = []
    $('#select-comparisons .checkbox-item').each ->
      if $(@).find('input[type="checkbox"]').first().is(':checked')
        selectedExperiments.push expId for expId in eval($(@).find('input[type="hidden"]').first().val())
    $('#select-experiments input[type="checkbox"]').each ->
      if $.inArray(parseInt($(@).prev().val()), selectedExperiments) == -1
        $(@).parent().remove()
  
  $('#select-comparisons .btn-primary').click ->
    $('.comparisons').append('<p></p><p></p>')
    $('#select-comparisons input[type="checkbox"]').each ->
      $('.comparisons p').last().append "#{$(@).parent().text()}<br />"
  
  $('#select-experiments .btn-primary').click ->
    $('.experiments').append('<p></p><p></p>')
    $('#select-experiments input[type="checkbox"]').each ->
      $('.experiments p').last().append "#{$(@).parent().text()}<input type=\"hidden\" name=\"experiments[]\" value=\"#{$.trim $(@).parent().text()}\" /><br />"
  
  $('#add-species-btn').click ->
    sources = $(@).prev().attr 'data-source'
    $(@).before '<input name="species[]" type="text" data-provide="typeahead" />'
    $(@).prev().attr 'data-source', sources
    false
  
  speciesEntered = ->
    $('#select-comparisons-btn').removeClass 'disabled'
    $('#select-experiments-btn').removeClass 'disabled'
