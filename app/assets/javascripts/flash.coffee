$(document).on 'ready page:load', ->
  setTimeout (->
    $('#flash').fadeOut ->
      $(this).remove()
    return
  ), 10000
  return
