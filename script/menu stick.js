// alert()
$(document).ready(function(){
	// alert()
	var h = $("#banner").height()
	// alert(h)

	$(window).scroll(function(){

		if($(window).scrollTop() > h)
		{
			// $("body").css("background" , "red")
			$("#menu").css({
				"position" : "fixed",
				"z-index" : "1000", 
				"top" : "0"
			})

			// $("#menu a").css({"margin-left" , "70px"})

			$("#top").css("display" , "block")
		}
		else
		{
			$("#menu").css({
				"position" : "static"
				// "width" : "960px"

			})

			$("#top").css("display" , "none")
			// $("body").css("background" , "none")
		}
	})

	$("#top").click(function(){

		$("body").animate({
			"scrollTop" : "0"
		},500)
	})
})