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
//= require jquery3
//= require rails-ujs
//= require jquery.Jcrop
//= require popper
//= require bootstrap-sprockets
//= require dist/trix
//= require_tree . 


function getCookie(name) {
  var matches = document.cookie.match(new RegExp(
    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
  ));
  return matches ? decodeURIComponent(matches[1]) : undefined;
}


function block_swich(block1, block2, disp) {

if (getCookie("first1") != "" && getCookie("first2") != "") {
  var old_block1 = getCookie("first1");
   var old_block2 = getCookie("first2"); 

    if (old_block1 != block1 && old_block2 != block2) {
    document.getElementById(old_block1).style.display = disp;  
    document.getElementById(old_block2).style.display = 'none';  
    }
}


  if (document.getElementById(block1).style.display == disp || document.getElementById(block1).style.display == "") {
    
    document.cookie = "first1=" + block1;
    document.cookie = "first2=" + block2;

    document.getElementById(block1).style.display = 'none';
    document.getElementById(block2).style.display = disp;
    
  } else {
    document.getElementById(block1).style.display = disp;
    document.getElementById(block2).style.display = 'none';  

    document.cookie = "first1="//clean the cookie
    document.cookie = "first2="//clean the cookie


  }
}



    //Функция отображения PopUp
    function PopUpShow(){
        $("#popup1").show();
    }
    //Функция скрытия PopUp
    function PopUpHide(){
        $("#popup1").hide();
    }


