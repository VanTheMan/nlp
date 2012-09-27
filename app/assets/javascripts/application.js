// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery.sausage
//= require fancybox
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
	$(".show_related_comments").live('click',function(){
		if ($(".related_comments").is(':visible')){
			$(".related_comments").hide();
		} else {
			$(".related_comments").show();
		}
	});

	$("#edit_form").live('submit', function(){
		var url = $(this).attr("action");
		var type = $(this).attr("method");
		var f = $(this);
		// alert("fuck");
		$.ajax({
			url: url,
			type: type,
			dataType: "json",
			data: f.serialize(),
			success: function(response){
				if (response.success){
					$(".content").html(response.html);
					f[0].reset();
					console.log(response.html);
				} else {
					alert("something went wrong");
				}
			}
		});
		return false;
	});

	$('.container').append('<div id="top">Back to Top</div>');
   	$(window).scroll(function() {
    	if($(window).scrollTop() != 0) {
        	$('#top').fadeIn();
    	} else {
        	$('#top').fadeOut();
    	}
   	});
	$('#top').click(function() {
		$('html, body').animate({scrollTop:0},500);
	});

});
