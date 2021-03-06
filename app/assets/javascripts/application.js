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
// require turbolinks
// require jquery.turbolinks

//= require jquery_ujs
//= require jquery-ui
//= require foundation

// require_tree .


/** FUNCIONES DE ADMINISTRACON **/
/* Borra los campos para insertar imagen asociada a producto */
function remove_fields(link) {
	if (confirm("Vas a borrar una foto")) {
		$(link).prev("input[type=hidden]").val("1");
		$(link).closest(".image_field").hide();
	}
}

/* Inserta campos para adjuntar una nueva imagen */
function add_fields(link, association, content) {
	console.log(content);
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  // $(link).parent().before(content.replace(regexp, new_id));
  $(content.replace(regexp, new_id)).insertBefore($(link));
}
/** FIN - FUNCIONES DE ADMINISTRACON **/

$(function(){ $(document).foundation(); });
// $(function(){ $(".spinner").spinner(); });