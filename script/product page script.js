$(document).ready(function(){
	// alert()
	// $("ul").hide()
	$(".accordian > li").click(function(){
		// alert()
		if(false==$(this).next().is(':visible'))
		{
			$('.accordian > ul').slideUp(500);
		}
		$(this).next().slideToggle(500);
	})
	$('.accordian > ul:eq(0)').show()

})