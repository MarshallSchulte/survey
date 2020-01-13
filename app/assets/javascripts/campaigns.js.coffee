$(document).ready ->
    $("#send_to_reviewers").dataTable()
    bJQueryUI: true

ready = ->
	questions = $('.remove_fields').length
	console.log(questions)
	$('form').on 'click', '.remove_fields', (event) ->
	 if questions > 1
	  $(this).prev('input[type=hidden]').val('1')
	  $(this).closest('.field').detach()
	  event.preventDefault()
	  questions = questions - 1  
	  console.log(questions)
	  if questions == 1
	   $('.remove_fields').hide()

	
	$('#add_field').on 'click', (event) ->
	 $('.question-field:last').clone().insertAfter('.question-field:last')
	 questions = $('.question-field').length 
	 console.log(questions)
	 if questions == 2
	  $('.remove_fields').show()

$(document).on('page:change', ready);

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()