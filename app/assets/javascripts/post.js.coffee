$ ->
  $(".archive-month").click ->
    $(@).find('a').css('disabled', 'disabled')
  $(window).scroll ->
    distance_from_top = ( $(window).scrollTop() )
    if distance_from_top > 200
      $(".social_card").show('slide', 300)
    else
      $(".social_card").hide('slide', 300)

