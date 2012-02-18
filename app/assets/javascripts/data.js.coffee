# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  checkDataStatus = ->
    jobId = $('#job-id').val()
    $.getJSON "/data/status/#{jobId}", (data) ->
      if data.status == 'done'
        clearInterval window.statusInterval
        window.statusInterval = null
        $('.processing-progress').data('spinner').stop()
        $('.processing-status').text 'Your data is ready.'
        $('.processing-alert .alert').remove()
        $('.processing-alert').append '<div class="alert alert-success"><strong>Your data\'s ready!</strong> Thanks for waiting so patiently.</div>'
      else if data.status == 'error'
        clearInterval window.statusInterval
        window.statusInterval = null
        $('.processing-progress').data('spinner').stop()
        $('.processing-status').text 'An error occured.'
        $('.processing-alert .alert').remove()
        $('.processing-alert').append '<div class="alert alert-error"><strong>Whoops!</strong> Looks like something broke...</div>'
  
  # submits the uploader form when the upload button is pressed
  $('#bulk-uploader-modal .btn-primary').click ->
    $('#bulk-uploader-modal form').submit()
  
  # only execute this code for the /data/upload view
  if $('.processing-progress').length > 0
    # starts the progress indicator
    $('.processing-progress').spin {lines: 12, length: 16, width: 6, radius: 18, trail: 60, speed: 0.8}
  
    # checks the status of the data processing every 5 seconds
    window.statusInterval = setInterval(checkDataStatus, 5000)
  else
    window.statusInterval = null
