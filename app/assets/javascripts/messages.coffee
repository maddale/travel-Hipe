# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.card-header').click -> 
    id = this.id
    currentId = this.getAttribute('data-current-user')
    if this.getAttribute('data-cheked') #its READY to ajax
      
      $.ajax
        url: "/users/" + currentId + "/messages/" + id
        type: 'GET'
        dataType: 'script'
      
      this.setAttribute('data-cheked', '')

    else  #its NOT ready to ajax
      $('#collapse-' + id).slideUp(300)
      $('#message-respond-' + id).slideUp(300)
      setTimeout ->
        $('.talk-with-' + id).detach()
      , 600 
      
      this.setAttribute('data-cheked', 'ready')
  
  $("#drop-item").on 'click', (e) ->
    $('#drop-1').slideDown(300)

  $("#drop-item").mouseleave ->
    $('#drop-1').fadeOut(300)
  
  # $('.drop-li').on 'click' ->
  #   $('#drop-1').fadeOut(300)

# $('.delete-message').on 'ajax:success', (event) -> 
#   console.log 'jkljl'
  





    # console.log this.getAttribute('data-cheked')

    # console.log '.talk-with-' + id
    # $('.talk-with-' + id).fadeOut(300)







 # $('.yeah').on "ajax:success", (event) ->
    
#     if Boolean($('#collapse81')[0].getAttribute('data-cheked'))
#       $('#collapse81'). append event.detail[2].response
#       $('#collapse81')[0].setAttribute('data-cheked', '')
#       $('#counter81').fadeOut(300)
#       $('#counter81').detach()
#      else
#       $('#talk81').fadeOut(300)
#       $('#talk81').detach()
#       $('#collapse81')[0].setAttribute('data-cheked', 'ready')



# $('.yeah').on 'ajax.error', (e, xhr, status, error) ->
   