$(document).on 'ready page:load', ->
  setTimeout (->
    $('#flash').fadeOut ->
      $(this).remove()
    return
  ), 5000
  return
