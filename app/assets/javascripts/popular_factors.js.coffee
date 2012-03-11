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
  
  processFactor = (factor, i) ->
    popup = """
    <div id="factor-#{i}" class="modal hide fade">
      <div class="modal-header">
        <a class="close" data-dismiss="modal">×</a>
        <h3>#{factor[0]}</h3>
      </div>
      <div class="modal-body">
        <table class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>gene</th>
              <th>experiment</th>
              <th>comparison</th>
            </tr>
          </thead>
          <tbody></tbody>
        </table>
      </div>
      <div class="modal-footer">
        <a href="#" class="btn" data-dismiss="modal">Close</a>
      </div>
    </div>
    """
    $('.popular-factors-results').append popup
    $("#factor-#{i} table tbody").append("<tr><td>#{gene.name}</td><td>#{gene.experiment.label}</td><td>#{gene.comparison.state}</td></tr>") for gene in factor[1].genes
    
    $('.popular-factors-results .results-table table tbody').append("<tr><td><a href=\"#factor-#{i}\" data-toggle=\"modal\">#{factor[0]}</a></td><td>#{factor[1].total}</td><td>#{factor[1].genes.length}</td></tr>")
  
  startSearch = ->
    params = {}
    params.experiments = eval($('#search-params input[name="experiments"]').val())
    params.la = $('#search-params input[name="la"]').val()
    params.la_slash = $('#search-params input[name="la_slash"]').val()
    params.lq = $('#search-params input[name="lq"]').val()
    params.ld = $('#search-params input[name="ld"]').val()
    params.sort_by = $('#search-params input[name="sort_by"]').val()
    params.order = $('#search-params input[name="order"]').val()
    $('.processing-results-progress').spin {lines: 12, length: 16, width: 6, radius: 18, trail: 60, speed: 0.8}
    $.ajax
      url: "/popular_factors/results?experiments[]=#{params.experiments}&la=#{params.la}&la_slash=#{params.la_slash}&lq=#{params.lq}&ld=#{params.ld}&sort_by=#{params.sort_by}&order=#{params.order}",
      dataType: 'json',
      timeout: 3600000,
      error: (jqXHR, textStatus, errorThrown) ->
        console.log errorThrown
      success: (data) ->
        console.log data
        window.factors = data.factors
        $('.processing-results-progress').data('spinner').stop()
        $('.processing-results-status').text 'Your data is ready.'
        $('.processing-results-alert .alert').remove()
        $('.processing-results-alert').append '<div class="alert alert-success"><strong>Your data\'s ready!</strong> Thanks for waiting so patiently.</div>'
        table = """
        <table class="table table-bordered table-striped">
          <thead>
            <th>
              name
              <span class="arrows" style="float: right;">
                <a href="/popular_factors/search?experiments[]=#{params.experiments}&la=#{params.la}&la_slash=#{params.la_slash}&lq=#{params.lq}&ld=#{params.ld}&sort_by=name&order=asc"><i class="icon-chevron-up"></i></a>
                <a href="/popular_factors/search?experiments[]=#{params.experiments}&la=#{params.la}&la_slash=#{params.la_slash}&lq=#{params.lq}&ld=#{params.ld}&sort_by=name&order=desc"><i class="icon-chevron-down"></i></a>
              </span>
            </th>
            <th>
              # of total occurrences
              <span class="arrows" style="float: right;">
                <a href="/popular_factors/search?experiments[]=#{params.experiments}&la=#{params.la}&la_slash=#{params.la_slash}&lq=#{params.lq}&ld=#{params.ld}&sort_by=total&order=asc"><i class="icon-chevron-up"></i></a>
                <a href="/popular_factors/search?experiments[]=#{params.experiments}&la=#{params.la}&la_slash=#{params.la_slash}&lq=#{params.lq}&ld=#{params.ld}&sort_by=total&order=desc"><i class="icon-chevron-down"></i></a>
              </span>
            </th>
            <th>
              # of genes
              <span class="arrows" style="float: right;">
                <a href="/popular_factors/search?experiments[]=#{params.experiments}&la=#{params.la}&la_slash=#{params.la_slash}&lq=#{params.lq}&ld=#{params.ld}&sort_by=genes&order=asc"><i class="icon-chevron-up"></i></a>
                <a href="/popular_factors/search?experiments[]=#{params.experiments}&la=#{params.la}&la_slash=#{params.la_slash}&lq=#{params.lq}&ld=#{params.ld}&sort_by=genes&order=desc"><i class="icon-chevron-down"></i></a>
              </span>
            </th>
          </thead>
          <tbody></tbody>
        </table>
        """
        $('.popular-factors-results .results-table').append table
        processFactor(factor, i) for factor, i in data.factors
  
  startSearch() if $('#search-params').length > 0
