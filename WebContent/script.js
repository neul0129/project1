
$("#slideshow > div:gt(0)").hide();
setInterval(function() {
	$('#slideshow > div:first')
		.fadeOut(800)
		.next()
		.fadeIn(800)
		.end()
		.appendTo('#slideshow');
}, 4000);


/*
$(function () {
            var menu = document.querySelector('.menu');
            var menuPosition = menu.getBoundingClientRect();
            var placeholder = document.createElement('div');
            placeholder.style.width = menuPosition.width + 'px';
            placeholder.style.height = menuPosition.height + 'px';
            var isAdded = false;
            var mainMenuOffset = 30;
            var menuPositionTop = window.pageYOffset - (menuPosition.top * -1) - mainMenuOffset;
            window.addEventListener('scroll', function () {
                if (window.pageYOffset >= menuPositionTop && !isAdded) {
                    menu.classList.add('sticky');
                    menu.parentNode.insertBefore(placeholder, menu);
                    isAdded = true;
                } else if (window.pageYOffset 
<  menuPositionTop && isAdded) {
                    menu.classList.remove('sticky');
                    menu.parentNode.removeChild(placeholder);
                    isAdded = false;
                }
            });
        });
*/
	
	$("#product_btn1").click(function(){
			if($(".displaynone1").css("display") == "none") {
				$(".displaynone2").css("display","none");
				/*$(".displaynone1").show();*/
				$(".displaynone1").css("display","inline-block")
			} else {
				$(".displaynone1").hide();
			}

 	});
 	
	$("#product_btn2").click(function(){
			if($(".displaynone2").css("display") == "none") {
				$(".displaynone1").css("display","none");
				/*//$(".displaynone2").show();*/
				$(".displaynone2").css("display","inline-block")
			}  else {
				$(".displaynone2").hide();
			}

 	});
	
	$("#button_addtobag").click(function() {
		location.href="index.jsp?workgroup=cart&work=cart_list";
	});
	
	 document.getElementById("button_cart").onclick = function() {
	 	if($("#go_cart").val()==""){
		alert("수량을 입력하세요.");
		$("#go_cart").focus();
		}else{
	   cartForm.submit();  
		}
	}

    