/*! Copyright (c) 2011 Brandon Aaron (http://brandonaaron.net)
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Thanks to: http://adomas.org/javascript-mouse-wheel/ for some pointers.
 * Thanks to: Mathias Bank(http://www.mathias-bank.de) for a scope bug fix.
 * Thanks to: Seamus Leahy for adding deltaX and deltaY
 *
 * Version: 3.0.6
 * 
 * Requires: 1.2.2+
 */

(function($) {

var types = ['DOMMouseScroll', 'mousewheel'];

if ($.event.fixHooks) {
    for ( var i=types.length; i; ) {
        $.event.fixHooks[ types[--i] ] = $.event.mouseHooks;
    }
}

$.event.special.mousewheel = {
    setup: function() {
        if ( this.addEventListener ) {
            for ( var i=types.length; i; ) {
                this.addEventListener( types[--i], handler, false );
            }
        } else {
            this.onmousewheel = handler;
        }
    },
    
    teardown: function() {
        if ( this.removeEventListener ) {
            for ( var i=types.length; i; ) {
                this.removeEventListener( types[--i], handler, false );
            }
        } else {
            this.onmousewheel = null;
        }
    }
};

$.fn.extend({
    mousewheel: function(fn) {
        return fn ? this.bind("mousewheel", fn) : this.trigger("mousewheel");
    },
    
    unmousewheel: function(fn) {
        return this.unbind("mousewheel", fn);
    }
});


function handler(event) {
    var orgEvent = event || window.event, args = [].slice.call( arguments, 1 ), delta = 0, returnValue = true, deltaX = 0, deltaY = 0;
    event = $.event.fix(orgEvent);
    event.type = "mousewheel";
    
    // Old school scrollwheel delta
    if ( orgEvent.wheelDelta ) { delta = orgEvent.wheelDelta/120; }
    if ( orgEvent.detail     ) { delta = -orgEvent.detail/3; }
    
    // New school multidimensional scroll (touchpads) deltas
    deltaY = delta;
    
    // Gecko
    if ( orgEvent.axis !== undefined && orgEvent.axis === orgEvent.HORIZONTAL_AXIS ) {
        deltaY = 0;
        deltaX = -1*delta;
    }
    
    // Webkit
    if ( orgEvent.wheelDeltaY !== undefined ) { deltaY = orgEvent.wheelDeltaY/120; }
    if ( orgEvent.wheelDeltaX !== undefined ) { deltaX = -1*orgEvent.wheelDeltaX/120; }
    
    // Add event and delta to the front of the arguments
    args.unshift(event, delta, deltaX, deltaY);
    
    return ($.event.dispatch || $.event.handle).apply(this, args);
}

})(jQuery);


/* Copyright (c) 2012 HyeonJe Jun (http://github.com/noraesae)
 * Licensed under the MIT License
 */
((function($) {
	var  hiddenx = false;
	var hiddeny = false;
    $.fn.perfectScrollbar = function(option) {
		if(typeof option == "object"){
			hiddeny = option.hiddeny||false;
			hiddenx = option.hiddenx||false;
		}

        if(option === 'update') {
            if($(this).data('perfect_scrollbar_update')) {
                $(this).data('perfect_scrollbar_update')();
            }
            return $(this);
        }
        else if(option === 'destroy') {
            if($(this).data('perfect_scrollbar_destroy')) {
                $(this).data('perfect_scrollbar_destroy')();
            }
            return $(this);
        }

        if($(this).data('perfect_scrollbar')) {
            // if there's already perfect_scrollbar
            return $(this).data('perfect_scrollbar');
        }

        var $this = $(this).addClass('ps-container'),
            $content = $(this).children();
			
            
		if(hiddeny){
			var $scrollbar_x = $("<div class='ps-scrollbar-x'></div>").appendTo($this);
			var $scrollbar_y = $("").appendTo($this);
		}else if(hiddenx){
			var $scrollbar_x = $("").appendTo($this);
			var $scrollbar_y = $("<div class='ps-scrollbar-y'></div>").appendTo($this);
		}else{
			var $scrollbar_x = $("<div class='ps-scrollbar-x'></div>").appendTo($this);
			var $scrollbar_y = $("<div class='ps-scrollbar-y'></div>").appendTo($this);
		}
		
        var container_width,
            container_height,
            content_width,
            content_height,
            scrollbar_x_width,
            scrollbar_x_left,
            scrollbar_x_bottom = parseInt($scrollbar_x.css('bottom')),
            scrollbar_y_height,
            scrollbar_y_top,
            scrollbar_y_right = parseInt($scrollbar_y.css('right'));

        var updateContentScrollTop = function() {
            var scroll_top = parseInt(scrollbar_y_top * content_height / container_height);
            $this.scrollTop(scroll_top);
            $scrollbar_x.css({bottom: scrollbar_x_bottom - scroll_top});
        };

        var updateContentScrollLeft = function() {
            var scroll_left = parseInt(scrollbar_x_left * content_width / container_width);
            $this.scrollLeft(scroll_left);
            $scrollbar_y.css({right: scrollbar_y_right - scroll_left});
        };

        var updateBarSizeAndPosition = function() {
            container_width = $this.width();
            container_height = $this.height();
            content_width = $content.outerWidth(false);
            content_height = $content.outerHeight(false);
            if(container_width < content_width) {
                scrollbar_x_width = parseInt(container_width * container_width / content_width);
                scrollbar_x_left = parseInt($this.scrollLeft() * container_width / content_width);
            }
            else {
                scrollbar_x_width = 0;
                scrollbar_x_left = 0;
                $this.scrollLeft(0);
            }
            if(container_height < content_height) {
                scrollbar_y_height = parseInt(container_height * container_height / content_height);
                scrollbar_y_top = parseInt($this.scrollTop() * container_height / content_height);
            }
            else {
                scrollbar_y_height = 0;
                scrollbar_y_left = 0;
                $this.scrollTop(0);
            }

            $scrollbar_x.css({left: scrollbar_x_left + $this.scrollLeft(), bottom: scrollbar_x_bottom - $this.scrollTop(), width: scrollbar_x_width});
            $scrollbar_y.css({top: scrollbar_y_top + $this.scrollTop(), right: scrollbar_y_right - $this.scrollLeft(), height: scrollbar_y_height});
        };

        var moveBarX = function(current_left, delta_x) {
            var new_left = current_left + delta_x,
                max_left = container_width - scrollbar_x_width;

            if(new_left < 0) {
                scrollbar_x_left = 0;
            }
            else if(new_left > max_left) {
                scrollbar_x_left = max_left;
            }
            else {
                scrollbar_x_left = new_left;
            }
            $scrollbar_x.css({left: scrollbar_x_left + $this.scrollLeft()});
        };

        var moveBarY = function(current_top, delta_y) {
            var new_top = current_top + delta_y,
                max_top = container_height - scrollbar_y_height;

            if(new_top < 0) {
                scrollbar_y_top = 0;
            }
            else if(new_top > max_top) {
                scrollbar_y_top = max_top;
            }
            else {
                scrollbar_y_top = new_top;
            }
            $scrollbar_y.css({top: scrollbar_y_top + $this.scrollTop()});
        };

        var bindMouseScrollXHandler = function() {
            var current_left,
                current_page_x;

            $scrollbar_x.bind('mousedown.perfect-scroll', function(e) {
                current_page_x = e.pageX;
                current_left = $scrollbar_x.position().left;
                $scrollbar_x.addClass('in-scrolling');
                e.stopPropagation();
                e.preventDefault();
            });

            $(document).bind('mousemove.perfect-scroll', function(e) {
                if($scrollbar_x.hasClass('in-scrolling')) {
                    moveBarX(current_left, e.pageX - current_page_x);
                    updateContentScrollLeft();
                    e.stopPropagation();
                    e.preventDefault();
                }
            });

            $(document).bind('mouseup.perfect-scroll', function(e) {
                if($scrollbar_x.hasClass('in-scrolling')) {
                    $scrollbar_x.removeClass('in-scrolling');
                }
            });
        };

        var bindMouseScrollYHandler = function() {
            var current_top,
                current_page_y;

            $scrollbar_y.bind('mousedown.perfect-scroll', function(e) {
                current_page_y = e.pageY;
                current_top = $scrollbar_y.position().top;
                $scrollbar_y.addClass('in-scrolling');
                e.stopPropagation();
                e.preventDefault();
            });

            $(document).bind('mousemove.perfect-scroll', function(e) {
                if($scrollbar_y.hasClass('in-scrolling')) {
                    moveBarY(current_top, e.pageY - current_page_y);
                    updateContentScrollTop();
                    e.stopPropagation();
                    e.preventDefault();
                }
            });

            $(document).bind('mouseup.perfect-scroll', function(e) {
                if($scrollbar_y.hasClass('in-scrolling')) {
                    $scrollbar_y.removeClass('in-scrolling');
                }
            });
        };

        // bind handlers
        var bindMouseWheelHandler = function() {
            var shouldPreventDefault = function(deltaX, deltaY) {
                var scrollTop = $this.scrollTop();
                if(scrollTop == 0 && deltaY > 0 && deltaX == 0) {
                    return false;
                }
                else if(scrollTop >= content_height - container_height && deltaY < 0 && deltaX == 0) {
                    return false;
                }

                var scrollLeft = $this.scrollLeft();
                if(scrollLeft == 0 && deltaX < 0 && deltaY == 0) {
                    return false;
                }
                else if(scrollLeft >= content_width - container_width && deltaX > 0 && deltaY == 0) {
                    return false;
                }
                return true;
            };

            $this.mousewheel(function(e, delta, deltaX, deltaY) {
                $this.scrollTop($this.scrollTop() - (deltaY * 10));
                $this.scrollLeft($this.scrollLeft() + (deltaX * 10));

                // update bar position
                updateBarSizeAndPosition();

                if(shouldPreventDefault(deltaX, deltaY)) {
                    e.preventDefault();
                }
            });
        };

        // bind mobile touch handler
        var bindMobileTouchHandler = function() {
            var applyTouchMove = function(difference_x, difference_y) {
                $this.scrollTop($this.scrollTop() - difference_y);
                $this.scrollLeft($this.scrollLeft() - difference_x);

                // update bar position
                updateBarSizeAndPosition();
            };

            var start_coords = {},
                start_time = 0,
                speed = {},
                breaking_process = null;

            $this.bind("touchstart.perfect-scroll", function(e) {
                var touch = e.originalEvent.targetTouches[0];

                start_coords.pageX = touch.pageX;
                start_coords.pageY = touch.pageY;

                start_time = (new Date()).getTime();

                if (breaking_process !== null) {
                    clearInterval(breaking_process);
                }
            });
            $this.bind("touchmove.perfect-scroll", function(e) {
                var touch = e.originalEvent.targetTouches[0];

                var current_coords = {};
                current_coords.pageX = touch.pageX;
                current_coords.pageY = touch.pageY;

                var difference_x = current_coords.pageX - start_coords.pageX,
                    difference_y = current_coords.pageY - start_coords.pageY;

                applyTouchMove(difference_x, difference_y);
                start_coords = current_coords;

                var current_time = (new Date()).getTime();
                speed.x = difference_x / (current_time - start_time);
                speed.y = difference_y / (current_time - start_time);
                start_time = current_time;

                e.preventDefault();
            });
            $this.bind("touchend.perfect-scroll", function(e) {
                breaking_process = setInterval(function() {
                    if(Math.abs(speed.x) < 0.01 && Math.abs(speed.y) < 0.01) {
                        clearInterval(breaking_process);
                        return;
                    }

                    applyTouchMove(speed.x * 30, speed.y * 30);

                    speed.x *= 0.8;
                    speed.y *= 0.8;
                }, 10);
            });
        };

        var destroy = function() {
            $scrollbar_x.remove();
            $scrollbar_y.remove();
            $this.unbind('mousewheel');
            $this.unbind('touchstart.perfect-scroll');
            $this.unbind('touchmove.perfect-scroll');
            $this.unbind('touchend.perfect-scroll');
            $(window).unbind('mousemove.perfect-scroll');
            $(window).unbind('mouseup.perfect-scroll');
            $this.data('perfect_scrollbar', null);
            $this.data('perfect_scrollbar_update', null);
            $this.data('perfect_scrollbar_destroy', null);
        };

        var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent);

        var initialize = function() {
            updateBarSizeAndPosition();
            bindMouseScrollXHandler();
            bindMouseScrollYHandler();
            if(isMobile) bindMobileTouchHandler();
            if($this.mousewheel) bindMouseWheelHandler();
            $this.data('perfect_scrollbar', $this);
            $this.data('perfect_scrollbar_update', updateBarSizeAndPosition);
            $this.data('perfect_scrollbar_destroy', destroy);
        };

        // initialize
        initialize();

        return $this;
    };
})(jQuery));