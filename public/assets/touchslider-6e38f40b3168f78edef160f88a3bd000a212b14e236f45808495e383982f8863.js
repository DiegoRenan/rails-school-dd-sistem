$.fn.bsTouchSlider=function(){var n=$(".carousel");return this.each(function(){function i(n){n.each(function(){var n=$(this),i=n.data("animation");n.addClass(i).one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend",function(){n.removeClass(i)})})}var a=n.find(".item:first").find("[data-animation ^= 'animated']");n.carousel(),i(a),n.on("slide.bs.carousel",function(n){i($(n.relatedTarget).find("[data-animation ^= 'animated']"))}),$(".carousel .carousel-inner").swipe({swipeLeft:function(){this.parent().carousel("next")},swipeRight:function(){this.parent().carousel("prev")},threshold:0})})};