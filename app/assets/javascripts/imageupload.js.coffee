# $ ->
#   $(document).on "upload:start", "form", (e) ->
#     $(this).find("input[type=submit]").attr "disabled", true
#     console.log("start")
#   $(document).on "upload:progress", "form", (e) ->
#     detail          = e.originalEvent.detail
#     percentComplete = Math.round(detail.loaded / detail.total * 100)
#     console.log("progress")
#   $(document).on "upload:success", "form", (e) ->
#     $(@).find("input[type=submit]").removeAttr "disabled" unless $(@).find("input.uploading").length
#     avatar_id = JSON.parse($('#author_avatar').val()).id
#     $('#image').html $("<img />").attr(
#       src: "/attachments/cache/fill/200/200/#{avatar_id}/avatar"
#     )
#     console.log("complete")

$ ->
  $(document).on "upload:start", "form", (e) ->
    $(this).find("input[type=submit]").attr "disabled", true
    console.log("start")
  $(document).on "upload:progress", "form", (e) ->
    detail          = e.originalEvent.detail
    percentComplete = Math.round(detail.loaded / detail.total * 100)
    console.log("progress")
    $('#image').html $("<i class='fa fa-circle-o-notch fa-spin fa-2x'></i>")
  $(document).on "upload:success", "form", (e) ->
    $(@).find("input[type=submit]").removeAttr "disabled" unless $(@).find("input.uploading").length
    image_id = JSON.parse($('#post_image').val()).id
    $('#image').find('i').replaceWith("<i class='fa fa-plus fa-2x'></i>")
    $('#image').html $("<img />").attr(
      src: "/attachments/cache/fill/200/200/#{image_id}/image"
    )
    console.log("complete")
