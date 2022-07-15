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
$(document).on("turbolinks:load", function(){
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

// クリップボードへコピー
$(function(){
  $('#copy_image').on('click', function(event){
    //対象を取得
    var targetImageTag=document.getElementById("copyTarget");
    if(navigator.clipboard){
      //クリップボードにコピー
      navigator.clipboard.writeText(targetImageTag.outerHTML).then(function(){
        console.log("coppied.");
      },function(){
        console.log("coppy denied.");
      });
    }else{
      console.log("coppy denied.");
    }
  });
});