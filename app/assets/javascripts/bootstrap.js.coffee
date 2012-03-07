jQuery ->
  $(".alert-message").alert()
  $(".tabs").button()
  $(".carousel").carousel()
  $(".collapse").collapse()
  $(".dropdown-toggle").dropdown()
  $(".navbar").scrollspy()
  $(".tab").tab "show"
  $(".tooltip").tooltip()
  $(".typeahead").typeahead() 
  
  $('a.edit').tooltip(title: 'edit')
  $('.arrows').each ->
    $(@).find('a:first').tooltip(title: 'sort ascending')
    $(@).find('a:last').tooltip(title: 'sort descending')
