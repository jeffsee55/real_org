$ ->
  $("#category_tag_color").colpick(
    layout: "hex"
    submit: 0
    onChange: (hsb, hex, rgb, el, bySetColor) ->
      $(el).css "border-color", "#" + hex
      $(el).val hex  unless bySetColor
      return
  ).keyup ->
    $(this).colpickSetColor @value
    color = $(@).val()
    if color.slice(0,1) == "#"
      $(@).val(color.slice(1))
    return
