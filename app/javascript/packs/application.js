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

// アコーディオンメニュー
$(document).on('turbolinks:load', function() {
  $('#search a').on('click', function(){
    if($('.content').hasClass('open')){
      $('.content').removeClass('open');
      $('.content').slideUp();
      return false;
    }else{
      $('.content').addClass('open');
      $('.content').slideDown();
      return false;
    }
  });
});

// トップへ戻る
window.onload = function(){
  $('#top a').on('click', function(event){
    console.log("クリックされました");
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
};

// クリップボードへコピー
window.onload = function(){
  $(document).on('click', '.copy_image', function(event){
    //対象を取得
    var image_id=event.target.id;
    console.log(`${image_id}がクリックされました`);
    var targetImageTag=document.getElementById(`copyTarget${image_id}`);
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
  return false;
};