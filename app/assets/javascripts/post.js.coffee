$ ->
  $(window).scroll ->
    distance_from_top = ( $(window).scrollTop() )
    if distance_from_top > 200
      $(".social_card").show('slide', 500)
    else
      $(".social_card").hide('slide', 500)

  window.fbAsyncInit = ->
    FB.init
      appId: '714905915289688'
      xfbml: true
      version: 'v2.2'
    return

    ((d, s, id) ->
      js = undefined
      fjs = d.getElementsByTagName(s)[0]
      if d.getElementById(id)
        return
      js = d.createElement(s)
      js.id = id
      js.src = '//connect.facebook.net/en_US/sdk.js'
      fjs.parentNode.insertBefore js, fjs
      return
    ) document, 'script', 'facebook-jssdk'
