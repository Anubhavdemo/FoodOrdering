
	
index=0;
	function changebanner()
{
	index++;
	if(index == 7)
		index =1
    document.getElementById("bannerimg").setAttribute("src","img/slide"+index+".jpg")
	t=setTimeout("changebanner()",2000)
}

$(document).ready(function(){


			flag = 0
			$("#slidericon").click(function(){

				if(flag ==0)
				{
					$("#rmenu").animate({
						"left" : "0"
					},800)
					flag = 1
				}
				else
				{
					$("#rmenu").animate({
						"left" : "-100"
					},800)
					flag = 0
				}
			})

			

	$(".bannerimg:not(:first)").hide()
				// alert()
	var index = 0
		setInterval(function(){
			// alert()
			$(".bannerimg:eq(" +index+ ")").fadeOut(1000)
			$("#divlogo").hide()
			$("#divlogo").css({
				// "height" : "0",
				// "width" : "0"
				"-webkit-transform" : "scale(0)",
				"-ms-transform" : "scale(0)",
				"transform" : "scale(0)"
			})
			index = (index + 1) % 6
			$(".bannerimg:eq(" +index+ ")").fadeIn(1000)
			$("#divlogo").show()
			$("#divlogo").css({
				// "height" : "300px",
				// "width" : "300px"
				"-webkit-transform" : "scale(1)",
				"-ms-transform" : "scale(1)",
				"transform" : "scale(1)"
			})		
			},3000)	
		})