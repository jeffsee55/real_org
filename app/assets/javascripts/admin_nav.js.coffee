$ ->
  $('.sidebar .toggle_menu').click ->
    $('.sidebar').toggleClass('show-sidebar', 500, 'swing')
    $(@).toggleClass("spin")
  $(".js-accordion-trigger").bind "click", (e) ->
    $(@).parent().find(".submenu").slideToggle "fast" # apply the toggle to the ul
    e.preventDefault()
  $(window).load ->
    $('.load').fadeOut('slow')
  $('#options').click ->
    $('.options').css("right", "0")
  $('#options_close').click ->
    $('.options').css("right", "-900px")
