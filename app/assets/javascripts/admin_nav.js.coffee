$ ->
  $('.sidebar .toggle_menu').click ->
    $('.sidebar').toggleClass('show-sidebar', 300, 'swing')
  $(window).load ->
    $('.load').fadeOut('slow')
