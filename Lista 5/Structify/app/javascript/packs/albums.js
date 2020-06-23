$(document).on('turbolinks:load', function () {

    var listened_btn = document.getElementsByClassName('listened');
    var not_listened_btn = document.getElementsByClassName('not_listened');
    var clear_listened_btn = document.getElementsByClassName('clear_listened');

    $(listened_btn).click( function() {
        $(this).closest('tr').css('background-color', '#81da85')
    });

    $(not_listened_btn).click( function() {
        $(this).closest('tr').css('background-color', '#da8b81')
    });

    $(clear_listened_btn).click( function() {
        $(this).closest('tr').css('background-color', 'white')
    });

});