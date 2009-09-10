$.jQTouch({
    icon: '/images/jqtouch.png',
    addGlossToIcon: false,
    startupScreen: '/images/jqt_startup.png',
    statusBar: 'black',
    preloadImages: [
				// TODO
				// Images are not there
				
        //'/themes/jqt/img/chevron_white.png',
        //'/themes/jqt/img/bg_row_select.gif',
        '/themes/jqt/img/back_button.png',
        '/themes/jqt/img/back_button_clicked.png',
        '/themes/jqt/img/button_clicked.png',
        '/themes/jqt/img/grayButton.png',
        '/themes/jqt/img/whiteButton.png',
        '/themes/jqt/img/loading.gif'
        ]
});

// Some sample Javascript functions:
$(function(){
    
    // Show a swipe event on swipe test
    $('#swipeme').addTouchHandlers().bind('swipe', function(evt, data){                
        $(this).html('You swiped <strong>' + data.direction + '</strong>!');
        // alert('Swiped '+ data.direction +' on #' + $(evt.currentTarget).attr('id') + '.');
    });

    $('a[target="_blank"]').click(function(){
        if(confirm('This link opens in a new window.'))
        {
            return true;
        }
        else
        {
            $(this).removeClass('active');
            return false;
        }
    });
    
    // Page transition callback events
    $('#pageevents').
        bind('pageTransitionStart', function(e, info){
            $(this).find('.info').append('Started transitioning ' + info.direction + '&hellip; ');
        }).
        bind('pageTransitionEnd', function(e, info){
            $(this).find('.info').append(' finished transitioning ' + info.direction + '.<br /><br />');
        });
        
    
    // AJAX with callback event
    $('#callback').
        bind('pageTransitionEnd', function(e, info){
            if (info.direction == 'in' && $(this).data('loaded') != 'true')
            {
                $(this).
                    append($('<div>Loading&hellip;</div>').
                    load('ajax.html .info', function(){
                        $(this).parent().data('loaded', 'true');
                    }));
            }
        });

    // Orientation callback event
    $('body').bind('turn', function(e, data){
        $('#orient').html('Orientation: ' + data.orientation);
    })
});