stripeResponseHandler = (status, response) ->
  if response.error
    #alert error if any?
    alert response.error.message
  else  
    console.log("Stripe token has been generated #{response['id']}")
    # create a hidden input that will push the token to the server
    $("#payment-form").append "<input type='hidden' name='stripeToken' value='#{response['id']}'/>"

$(document).ready ->
  # setting the stripe key
  Stripe.setPublishableKey $("meta[name=\"stripe-key\"]").attr("content")
  # binding action on submitting of the form
  $("#payment-form").submit (e) ->
    # creating card object from vals in the form
    card =
      number: $("#card_number").val()
      cvc: $("#card_code").val()
      exp_month: $("#card_month").val()
      exp_year: $("#card_year").val()
    console.log card
    # creating the token via stripe API
    Stripe.card.createToken card, stripeResponseHandler
    # this is optional, just for demonstational purposes that it is working.. remove it and the form will get submited
    # here should be some statement for validation of some sort but this is up to you!
    e.preventDefault()