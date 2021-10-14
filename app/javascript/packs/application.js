// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("jquery")
import "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// トップへ戻る
$(function(){
  $('#top a').on('click', function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});

// アコーディオンメニュー
$(function(){
  $('#search div').on('click', function(){
    if($('.content').hasClass('open')){
      $('.content').removeClass('open');
      $('.content').slideUp();
    }else{
      $('.content').addClass('open');
      $('.content').slideDown();
    }
  });
});