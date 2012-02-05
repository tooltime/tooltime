$ ->
  $('.nav .home').addClass 'active' if $('.content').hasClass 'welcome'
  $('.nav .browse-comparisons').addClass 'active' if $('.content').hasClass 'browse-comparisons'
