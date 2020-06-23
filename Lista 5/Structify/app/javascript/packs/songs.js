
$(document).on('turbolinks:load', function () {

    var like_btn = document.getElementsByClassName('like_button');

    $(like_btn).click( function() {
        like_btn_id = $(this).attr('id').split("_");
        console.log(like_btn_id[2]);
        var sym_id = "like_sym_" + like_btn_id[2];
        var symbol = document.getElementById(sym_id);
        if(symbol.style.display == "none"){
            symbol.style.visibility = "block";
            console.log(symbol);
        }
        else{
            symbol.style.visibility = "none";
            console.log(symbol);
        }
    });
});