// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require jquery.dd.min
//= require twitter/typeahead
//= require sweetalert
//= require sweet-alert-confirm
//= require_tree .

$(document).on('keyup', 'input', function(e){
  if(e.keyCode == 13)
    $(this).trigger("enter")
})

jQuery.fn.enter = function(handler) {
  $(this).on('enter', handler)
}
