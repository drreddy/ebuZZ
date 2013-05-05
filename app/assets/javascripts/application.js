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
		var dest = $(this).attr("href");
		//alert(type +' / '+ name +' / '+ dest);
			if($(this).attr('class')=='test'){
				$(this).removeClass("test");
				$(this).addClass('done');
				$.ajax({ 
				  type: 'POST', 
				  url: '/test', 
				  data: {'info' : name , 'type' : type }, 
				  success: function(data){
				  	$(dest + ' .modal-body .content').hide();
				  	var actdata = data.aInfo.teaser;
				  	//alert(actdata);
				  	//var parts = actdata.split("</p><p>");
				  	//alert(parts[0]);
					//for (i = 0, l = parts.length; i < l; i += 2) {
					//    $("#" + parts[i]).text(parts[i + 1]);
					//}
				  	$(dest + ' .modal-body .content').html(actdata);

				  	if(data.hasOwnProperty('aVideo')){
				  		var url = data.aVideo.link;
				  		var video = "<br/><hr/><center><embed src='"+url+"' type='application/x-shockwave-flash' allowfullscreen='true' width='360' height='222' title='Adobe Flash Player'></center><hr/>";
				 		$(dest + ' .modal-body .content').append(video);
				  	}
				 	$(dest + ' .modal-body .content').fadeIn();
			    } 
			 });
			};
		});
	};
});
