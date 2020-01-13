$(document).on("page:change", function(){


  
function datarray(data){
				
			    var array = new Array();
			    for(var i=0; i<data.length; i++) {
			      array.push({ data: data[i], label: data[i].name, id: data[i].id});
			    }
			    return array;
};

$.getJSON("/vendors").success(function(data){
		$("#vendor").autocomplete({
			source: datarray(data),
			select: function(event, ui) {
		        $("#vendor").val(ui.item.label);
		        $("#vendor-id").val(ui.item.id);
		    },
			dataType: "json",
			minlength: 2,
			appendTo: "#vendor-select"
		});
});
  

  var questions;
	  questions = $('.remove_fields').length;
	  if (questions === 1) {
	        $('.remove_fields').hide();
	  }
	  $('form').on('click', '.remove_fields', function() {
	    if (questions > 1) {
	      var iterator_class = parseInt($(this).parent().children('.iterator').text());

	      $('.iterator').each(function(){
		      if ($(this).text() > iterator_class){
		      	var integerator = parseInt($(this).text()) - 1;
		      	$(this).text(integerator);
		      }
	      });
	      $(this).prev('input[type=hidden]').val('1');
	      $(this).closest('.field').fadeOut().detach();
	      event.preventDefault();
	      questions = questions - 1;

	      if (questions === 1) {
	        $('.remove_fields').hide();
	      }
	    }
	  });
	  
	  $('#add_field').on('click', function() {
	  	var backdrop_height = $('.edit_campaign').outerHeight();
		var new_height = backdrop_height + 400;
	  	$('.modal-backdrop').css({'height': new_height});
	  	var last = $('.question-field').last();
	  	
	    var clone = $('.question-field').last().clone();
	        $(clone).insertAfter(last);
	        
	        $('.question-field:last select').each(function(){
		    	var div_id = "#"+$(this).attr('id');
		    	var div_id_no = $('.question-field:last select').attr('id');
		    	var count = $('.question-field').length;
		        
			  	var previous_id = $(this).parent('.question-field').prev().children('select:first').attr('id');
			  	if (!previous_id){
			  		previous_id = $(this).parent('.kpi-field').parent('.question-field').prev().children('select:first').attr('id');
			  	}

			  	var split = parseInt(previous_id.split('_')[3]);
			  	var iterator = split + 1;
			  	var metric_div = "#campaign_questions_attributes_"+split+"_metric_id";
			  	
			  	if (div_id == metric_div){

			  		$(this).attr('id', "campaign_questions_attributes_"+iterator+"_metric_id");
			  		$(this).attr('name', "campaign[questions_attributes]["+iterator+"][metric_id]");
			  		$(this).parent('.question-field').children('.role-field').children("div").find('input').each(function(){
				  		if( $(this).attr('type') == 'hidden'){
				  			$(this).attr("name", $(this).attr("name").replace(/\d+/, iterator) );
				  		}
				  		else{
				  			$(this).attr("name", $(this).attr("name").replace(/\d+/, iterator) );
				  			$(this).attr("id", $(this).attr("id").replace(/\d+/, iterator) );
				  		}
				  	});
				  	$(this).parent('.question-field').children('.answer-field').children(".answer-option").find('input').each(function(){
				  		
				  			$(this).attr("name", $(this).attr("name").replace(/\d+/, iterator) );
				  			$(this).attr("id", $(this).attr("id").replace(/\d+/, iterator) );
				  
				  	});
				  	$(this).parent('.question-field').children(".weight-field input").attr("name", $(this).attr("name").replace(/\d+/, iterator) );
				  	$(this).parent('.question-field').children(".weight-field input").attr("id", $(this).attr("id").replace(/\d+/, iterator) );
				  	$("#campaign_questions_attributes_"+iterator+"_kpi_id").find('option').remove();
			  		$(this).val("");
			        $('.question-field:last .iterator').text("");
			        $('.question-field:last .iterator').append(count);
			        
			  		$('.question-field select').change(function(){
			  		var backdrop_height = $('.edit_campaign').outerHeight();
					var new_height = backdrop_height + 400;
	  				$('.modal-backdrop').css({'height': new_height});
				  	var div_id = "#"+$(this).attr('id');
				  	var split = div_id.split('_');
				  	var iterator = split[3];
				  	var value = $(this,'option:selected').val();
				  	var metric_div = "#campaign_questions_attributes_"+iterator+"_metric_id";
				  	var kpi_div = "#campaign_questions_attributes_"+iterator+"_kpi_id";
				  	if (div_id === metric_div){
					  	if (value){
						  	$.getJSON("/metrics/" + value + "/kpis", {} ).success(function(data) {
						  	 $("#campaign_questions_attributes_"+iterator+"_kpi_id").find('option').remove();
						  	 $(kpi_div).append("<option selected='selected'>Select a KPI</option>");
					  		 for (var i = 0; i < data.length; i++){
					  		 	var id = data[i].id;
					  		 	var kpi_name = data[i].kpi;
					  		 	var kpim = data[i].kpi_measurement;
					  		 	var okpi = data[i].original_kpi_id;
					  		 	var options = "<option value='"+id+"'>"+kpi_name+"</option>";
					  		 	$(kpi_div, "option").each(function(){
					  		 		if ($(this).text() == kpi_name){
					  		 			return false;
					  		 		}
					  		 	});
					  		 	if (okpi){
								}else{
								  $(kpi_div).append(options);
								}
					  		 	$('#kpim_'+iterator).fadeOut().remove();
					  		 	$(".kpi-field #campaign_questions_attributes_"+iterator+"_kpi_id").fadeIn();
					  		 	$("label[for=campaign_questions_attributes_"+iterator+"_kpi_id]").fadeIn();
					  		 }
					
					    	});
					    }else{
					    	$(".kpi-field #campaign_questions_attributes_"+iterator+"_kpi_id").fadeOut();
					    	$("label[for=campaign_questions_attributes_"+iterator+"_kpi_id]").fadeOut();
					    	$('#kpim_'+iterator).fadeOut().remove();
					    }
				   }
				   else if (div_id === kpi_div){
				   	if ( (value == 'Select a KPI') || (!value)){ 
				   		$('#kpim_'+iterator).remove();
				   	}
				   	else {
				   		$.getJSON("/kpis/"+ value, {} ).success(function(data) {
				  		 	var id = data.id;
				  		 	var kpi_name = data.kpi;
				  		 	var kpim = data.kpi_measurement;
				  		 	var kpim_id = "kpim_"+iterator;
				  		 	$("#"+ kpim_id).fadeOut().remove();
				  		 	$( "<p id='"+kpim_id+"'>"+kpim+"</p>" ).fadeIn().insertAfter( $("#campaign_questions_attributes_"+iterator+"_kpi_id") );
				  		 	
				  	    });
				      }
				   }
				  });
			  	} else if (div_id_no == metric_div){
			  		$(this).attr('id', "campaign_questions_attributes_"+iterator+"_metric_id");
			  		$(this).attr('name', "campaign[questions_attributes]["+iterator+"][metric_id]");
			  		$("#campaign_questions_attributes_"+iterator+"_kpi_id").find('option').remove();
			  		$(this).val("");
			  	} else{
			  		$(this).attr('id', "campaign_questions_attributes_"+iterator+"_kpi_id");
			  		$(this).attr('name', "campaign[questions_attributes]["+iterator+"][kpi_id]");
			  		$(this).prev().attr('for', "campaign_questions_attributes_"+iterator+"_kpi_id");
			  		$("#campaign_questions_attributes_"+iterator+"_kpi_id").find('option').remove();
			  		$(this).hide();
			  		$(this).prev().hide();
			  		$(this).next().hide();
			  	}
		  	});
	    questions = $('.question-field').length;
	    if (questions === 2) {
	      $('.remove_fields').show();
	    }
	    $("input").change(function(){
		console.log($(this).attr('id'));
		var checkcount2 = 0;
		console.log("checkcount before loop: " + checkcount2);
		console.log("input is: " + $(this).attr('id'));
		console.log("parent is: " + $(this).parent('div').parent('.role-field').attr('class'));
		$(this).parent('div').parent('.role-field').children('div').children('input').each(function(){
			console.log("is this loop working?");
			console.log("this inside loop: " + $(this).attr('id'));
			if ($(this).is(':checked')){
				console.log("checked");
				checkcount2 += 1;
			}
		});
		console.log("checkcount after loop: " + checkcount2);
		if (checkcount2 > 0){
			console.log("checked:" + $(this));
			console.log("qf-class: " + $(this).parent("div").parent(".role-field").attr('class'));
			$(this).parent("div").parent(".role-field").parent(".question-field").css({"background-color": "#DDDDDD"});
		} else {
			$(this).parent("div").parent(".role-field").parent(".question-field").css({"background-color": "#FD8D8D"});
		}
	});
	  });
  var eacherator = 0;
  $('.question-field select').each(function(){
  	eacherator = eacherator + 1;
  	var div_id = "#"+$(this).attr('id');
  	var split = div_id.split('_');
  	var iterator = split[3];
  	var value = $(this,'option:selected').val();
  	var hidden_div = "#campaign_questions_attributes_"+iterator+"_id";
  	var hidden_value = $(hidden_div).val();
  	var metric_div = "#campaign_questions_attributes_"+iterator+"_metric_id";
  	var kpi_div = "#campaign_questions_attributes_"+iterator+"_kpi_id";
  	if (div_id == metric_div){
  		$("#campaign_questions_attributes_"+iterator+"_kpi_id").find('option').remove();
  	  console.log("hey" + value);
	  if (hidden_value){
		$.getJSON("/questions/" + hidden_value, {} ).success(function(data) {
	  		 var id = data.id;
	  		 var kpi_id = data.kpi_id;
	  		 var metric_id = data.metric_id;
			 if (metric_id){
			 	$.getJSON("/metrics/" + metric_id + "/kpis", {}).success(function(data){
			 	  for (var i = 0; i < data.length; i++){
		  		 	var id = data[i].id;
		  		 	var kpi_name = data[i].kpi;
		  		 	var kpim = data[i].kpi_measurement;
		  		 	var okpi = data[i].original_kpi_id;
		  		 	if (kpi_id == id){
		  		 		var options = "<option selected='selected' value='"+id+"'>"+kpi_name+"</option>";
		  		 		var kpim_id = "kpim_"+iterator;
			  		 	$("#"+ kpim_id).fadeOut().remove();
			  		 	$( "<p id='"+kpim_id+"'>"+kpim+"</p>" ).fadeIn().insertAfter( $("#campaign_questions_attributes_"+iterator+"_kpi_id") );
		  		 	}else{
		  		 		var options = "<option value='"+id+"'>"+kpi_name+"</option>";
		  		 	}
		  		 	var options = "<option value='"+id+"'>"+kpi_name+"</option>";
					if (okpi){
					}else{
					  $(kpi_div).append(options);
					}
			 	  }
			 	});
			 }
	  		 if (!kpi_id){
				$(".kpi-field #campaign_questions_attributes_"+iterator+"_kpi_id").fadeOut();
				$("label[for=campaign_questions_attributes_"+iterator+"_kpi_id]").fadeOut();
			  }
	    });
	 }else{
		$(".kpi-field #campaign_questions_attributes_"+iterator+"_kpi_id").fadeOut();
		$("label[for=campaign_questions_attributes_"+iterator+"_kpi_id]").fadeOut();
	 }
	}
  });
	  $('.question-field select').change(function(){
	  	var backdrop_height = $('.edit_campaign').outerHeight();
		var new_height = backdrop_height + 400;
	  	$('.modal-backdrop').css({'height': new_height});
	  	var div_id = "#"+$(this).attr('id');
	  	var split = div_id.split('_');
	  	var iterator = split[3];
	  	var value = $(this,'option:selected').val();
	  	var metric_div = "#campaign_questions_attributes_"+iterator+"_metric_id";
	  	var kpi_div = "#campaign_questions_attributes_"+iterator+"_kpi_id";
	  	if (div_id === metric_div){
		  	$("#campaign_questions_attributes_"+iterator+"_kpi_id").find('option').fadeOut().remove();
		  	$("#campaign_questions_attributes_"+iterator+"_kpi_id").prev().attr('for', "campaign_questions_attributes_"+iterator+"_kpi_id");
		  	$(kpi_div).append("<option selected='selected'>Select a KPI</option>");
		  	if (value){
			  	$.getJSON("/metrics/" + value + "/kpis", {} ).success(function(data) {
		  		 for (var i = 0; i < data.length; i++){
		  		 	var id = data[i].id;
		  		 	var kpi_name = data[i].kpi;
		  		 	var kpim = data[i].kpi_measurement;
		  		 	var okpi = data[i].original_kpi_id;
		  		 	var options = "<option value='"+id+"'>"+kpi_name+"</option>";
					if (okpi){
					}else{
					  $(kpi_div).append(options);
					}


		  		 	$('#kpim_'+iterator).fadeOut().remove();
		  		 	$(".kpi-field #campaign_questions_attributes_"+iterator+"_kpi_id").fadeIn();
		  		 	$("label[for=campaign_questions_attributes_"+iterator+"_kpi_id]").fadeIn();
		  		 }
		
		    	});
		    }else{
		    	$(".kpi-field #campaign_questions_attributes_"+iterator+"_kpi_id").fadeOut();
		    	$("label[for=campaign_questions_attributes_"+iterator+"_kpi_id]").fadeOut();
		    	$('#kpim_'+iterator).fadeOut().remove();
		    }
	   }
	   else if (div_id === kpi_div){
	   	if ( (value == 'Select a KPI') || (typeof value == 'null')){ 
	   		$('#kpim_'+iterator).remove();}
	   	else {
	   		$.getJSON("/kpis/"+ value, {} ).success(function(data) {
	  		 	var id = data.id;
	  		 	var kpi_name = data.kpi;
	  		 	var kpim = data.kpi_measurement;
	  		 	var kpim_id = "kpim_"+iterator;
	  		 	$("#"+ kpim_id).fadeOut().remove();
	  		 	$( "<p id='"+kpim_id+"'>"+kpim+"</p>" ).fadeIn().insertAfter( $("#campaign_questions_attributes_"+iterator+"_kpi_id") );
	  		 	
	  	    });
	      }
	   }
	  });

	  
});