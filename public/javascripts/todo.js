$.jQTouch({
    icon: '/images/icon.png',
    startupScreen: '/images/startup.png'
});

// Some sample Javascript functions:
$(function(){
    function submitForm(){
        $el = $('#add form');
				var value = $('#todo', $el).val() 
        if (value.length > 1)
        {
						$.post("/items", {body:value}, function(data){
							$('#home .incomplete').append($(data));
						})
						//             var itemid = $('#home ul li').length + 1;
						//             $('#home .incomplete').append($('<li><input type="checkbox" /> <span>' + value + '</span></li>'));
						// $.ajax({
						// 		url:"/items",
						// 		data:{body:value},
						// 		type:"POST"
						// 		
						// });
        }
        $('input').blur();
				$('input').val('');//$el.reset();
        $('#add .goback').click();        
        return false;
    }
    
    $('#add form').submit(submitForm);
    $('#add .whiteButton').click(submitForm);
    
    $('.complete li, .incomplete li').addTouchHandlers().bind('swipe', swiper);    
    
    $('input[type="checkbox"]').live('change', function(){
        var $el = $(this);
        if ($el.attr('checked'))
        {                    
            $el.parent().prependTo('.complete');
						// TODO:PUT
						$.post("/items/" + $el.val() + "/update_complete")
						
        }
        else
        {
            $el.parent().appendTo('.incomplete');
						$.post("/items/" + $el.val() + "/update_incomplete")
        }
				
    });
    
});

// Needed to make this global to call it from ajax on add
function swiper(event,info){
	$("div.action",event.currentTarget).html("Delete").show().click(function(){
		new Image('/images/wait.gif'); //preloader :)
		if(confirm("Delete me?")){
			$(this).html("<img src='/images/wait.gif'/>")
			var id = $(this).parent().attr('id').match(/\d+$/)
			$.ajax({
			  type: "DELETE",
			  url: "/items/" + id + ".js",
			  dataType: "script"
			});
		} else {
			$(this).hide();
		}
	})
}
