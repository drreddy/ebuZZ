//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
	
	var tot = $("#num").html();
	var i = 0;
	for(i=0;i<=tot;i++){
		$("#flip" + i).click(function(){
		var type = $(this).attr('rel');
		var name = $(this).text();
			if($(this).attr('class')=='test'){
				$.ajax({ 
				  type: 'POST', 
				  url: '/', 
				  data: {'info' : name , 'type' : type },
				  context: this, 
				  success: function(data){
				  	var dest = $(this).attr("href");
				  	$(dest + ' .modal-body .content').hide();
				  	if(data.hasOwnProperty('aInfo')){
				  		var actdata = data.aInfo.teaser;
					  	$(dest + ' .modal-body .content').html(actdata);
					  	if(data.hasOwnProperty('aVideo')){
					  		var vidid = data.aVideo.videoID;
					  		var video = "<br/><hr/><center><embed src='http://www.youtube.com/v/"+vidid+"' type='application/x-shockwave-flash' allowfullscreen='true' width='360' height='222' title='Adobe Flash Player'></center><hr/>";
					 		$(dest + ' .modal-body .content').append(video);
					  	}
					  	$(this).removeClass('test').addClass('done');
					}
					else{
						$(dest + ' .modal-body .content').html('error occured please try again later...');	
					}
				 	$(dest + ' .modal-body .content').fadeIn();
			    } 
			 });
			};
		});
	};
});
