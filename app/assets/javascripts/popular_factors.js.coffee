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
  
    if $('.processing-results-progress').length > 0
      # starts the progress indicator
      $('.processing-results-progress').spin {lines: 12, length: 16, width: 6, radius: 18, trail: 60, speed: 0.8}
  
  speciesEntered = ->
    $('#select-comparisons-btn').removeClass 'disabled'
    $('#select-experiments-btn').removeClass 'disabled'
  
  startSearch = ->
    params = {}
    params.experiments = eval($('#search-params input[name="experiments"]').val())
    params.la = $('#search-params input[name="la"]').val()
    params.la_slash = $('#search-params input[name="la_slash"]').val()
    params.lq = $('#search-params input[name="lq"]').val()
    params.ld = $('#search-params input[name="ld"]').val()
    console.log params
    $.ajax
      url: "/popular_factors/results?experiments[]=#{params.experiments}&la=#{params.la}&la_slash=#{params.la_slash}&lq=#{params.lq}&ld=#{params.ld}",
      dataType: 'json',
      timeout: 3600000,
      success: (data) ->
        console.log data.factors
        #$('.processing-results-progress').data('spinner').stop()
        #$('.processing-results-status').text 'Your data is ready.'
        #$('.processing-results-alert .alert').remove()
        #$('.processing-results-alert').append '<div class="alert alert-success"><strong>Your data\'s ready!</strong> Thanks for waiting so patiently.</div>'
        #$('.popular-factors-results table').append("<tr><td>#{name}</td><td>#{info.total}</td><td>#{info.genes.length}</td></tr>") for name, info in data.factors
  
  startSearch() if $('#search-params').length > 0
