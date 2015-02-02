$ ->
  $(".mobile_menu").click ->
    $(".nav_menu").toggle("fade", 200)
  $(".side-item").click ->
    $(@).find("ul").toggle("blind", "down")
  $(".toggle-search").click ->
    $(".search").toggle("blind")
  menuToggle = $("#js-centered-navigation-mobile-menu").unbind()
  $("#js-centered-navigation-menu").removeClass "show"
  menuToggle.on "click", (e) ->
    e.preventDefault()
    $("#js-centered-navigation-menu").slideToggle ->
      $("#js-centered-navigation-menu").removeAttr "style"  if $("#js-centered-navigation-menu").is(":hidden")
