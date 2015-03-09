$ ->
  source = ""
  image_placeholder = ""
  $(".image_upload").click ->
    source = $(@).parent(".card").find("input[type='hidden']")
    image_placeholder = $(@).siblings(".image")
    console.log source
    console.log "Placeholder: #{image_placeholder}"
  $(document).on "upload:start", "form", (e) ->
    $(this).find("input[type=submit]").attr "disabled", true
    console.log("start")
  $(document).on "upload:progress", "form", (e) ->
    detail          = e.originalEvent.detail
    percentComplete = Math.round(detail.loaded / detail.total * 100)
    console.log(percentComplete)
    image_placeholder.html $("<i class='fa fa-circle-o-notch fa-spin fa-3x'></i>")
  $(document).on "upload:success", "form", (e) ->
    $(@).find("input[type=submit]").removeAttr "disabled" unless $(@).find("input.uploading").length
    image_id = JSON.parse(source.val()).id
    console.log "Image id: #{image_id}"
    image_placeholder.html $("<img />").attr(
      src: "/attachments/cache/fill/300/300/#{image_id}/image"
    )
    console.log("complete")
