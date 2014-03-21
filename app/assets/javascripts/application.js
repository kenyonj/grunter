// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
(function($) {

  $.fn.charCount = function(options){
    
    // default configuration properties
    var defaults = {	
      allowed: 140,		
      warning: 25,
      css: 'counter',
      counterElement: 'span',
      cssWarning: 'warning',
      cssExceeded: 'exceeded',
      counterText: ''
    }; 
      
    var options = $.extend(defaults, options); 
    
    function calculate(obj){
      var count = $(obj).val().length;
      var available = options.allowed - count;
      if(available <= options.warning && available >= 0){
        $(obj).next().addClass(options.cssWarning);
      } else {
        $(obj).next().removeClass(options.cssWarning);
      }
      if(available < 0){
        $(obj).next().addClass(options.cssExceeded);
      } else {
        $(obj).next().removeClass(options.cssExceeded);
      }
      $(obj).next().html(options.counterText + available);
    };
        
    this.each(function() {  			
      $(this).after('<'+ options.counterElement +' class="' + options.css + '">'+ options.counterText +'</'+ options.counterElement +'>');
      calculate(this);
      $(this).keyup(function(){calculate(this)});
      $(this).change(function(){calculate(this)});
    });
    
  };

})(jQuery);
$(document).ready(function(){	
  $("#message1").charCount();
});
