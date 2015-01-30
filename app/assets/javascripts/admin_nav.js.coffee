$ ->
  $('.sidebar .toggle_menu').click ->
    $('.sidebar').toggleClass('show-sidebar', 500, 'swing')
    $(@).toggleClass("spin")
  $(window).load ->
    $('.load').fadeOut('slow')
