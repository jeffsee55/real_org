$ ->
  $(".facebook").click ->
    FB.ui {
    method: 'share'
    href: 'https://developers.facebook.com/docs/'
    }, (response) ->
