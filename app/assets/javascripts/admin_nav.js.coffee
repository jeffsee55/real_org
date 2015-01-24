$ ->
  $('.sidebar').mouseenter ->
    $('.sidebar .menu').show('slide', 300)
  $('.sidebar').mouseleave ->
    $('.sidebar .menu').hide('slide', 300)
  $('.side-item').mouseenter ->
    $(@).find('.dropdown').show("slide", 300)
    $(@).find('.icon').addClass('active')
    $(@).find('.icon').addClass('post')
  $('.side-item').mouseleave ->
    $(@).find('.dropdown').hide("fade", 300)
    $(@).find('.icon').removeClass('active')
    $(@).find('.icon').removeClass('post')
  $(window).load ->
    $('.load').fadeOut('slow')
