// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require_tree .
$(document).ready(function(){
    // $('#tasks_part').hide()
    // $('#index_user_project_part_tasks').click(function(){
    //     $('#all_tasks').hide(2000)
    //     $('#tasks_part').show(2000)
    // });
    //     $('#show_all_tasks').click(function(){
    //     $('#all_tasks').show()
    // });

    $('#modal, #bg_layer').hide()
    $('#show_modal').click(function on(){
        $('#modal, #bg_layer').fadeIn(500);
        $('#bg_layer').animate({
        opacity: 0.5
        });
    });

    $('#close_modal').click(function (){
        $('#modal, #bg_layer').fadeOut(500);
    });
});
