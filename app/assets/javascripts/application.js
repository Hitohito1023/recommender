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
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// navバーの記述
$(document).on('turbolinks:load', function () {
  $('#tab-contents .tab[id != "tab1"]').hide();
  $('#tab-menu a').on('click', function(event) {
    $("#tab-contents .tab").hide();
    $("#tab-menu .active").removeClass("active");
    $(this).addClass("active");
    $($(this).attr("href")).show();
    event.preventDefault();
  });
});

// Top画面のスライドショー
$(document).ready(function () {
  $("#slide-image").skippr({
    transition : 'slide',
    speed : 1000,
    easing : 'easeOutQuart',
    navType : 'block',
    childrenElementType : 'div',
    arrows : true,
    autoPlay : true,
    autoPlayDuration : 3000,
    keyboardOnAlways : true,
    hidePrevious : false
  });
});

// おすすめ、新着投稿のスライド
$(document).ready(function () {
  $('.recommend-items').slick({
  centerMode: true,
  centerPadding: '60px',
  prevArrow: '<i class="fas fa-chevron-left"></i>',
  nextArrow: '<i class="fas fa-chevron-right"></i>',
  slidesToShow: 4,
  slidesToScroll: 1
  });
});

// おすすめユーザーのスライド
$(document).ready(function () {
  $('.recommend-users').slick({
  centerMode: true,
  centerPadding: '60px',
  prevArrow: '<i class="fas fa-chevron-left"></i>',
  nextArrow: '<i class="fas fa-chevron-right"></i>',
  slidesToShow: 4,
  slidesToScroll: 1
  });
});

// 投稿画像のプレビュー
$(document).on("turbolinks:load", function(){
  function readURL(input) {
    if(input.files && input.files[0]){
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#post_item_image").change(function(){
    readURL(this);
  });
});

// プロフール画像のプレビュー
$(document).on("turbolinks:load", function(){
function readURL(input) {
  if(input.files && input.files[0]){
    var reader = new FileReader();
    reader.onload = function (e) {
      $('#img_prev').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}
$("#user_profile_image").change(function(){
  readURL(this);
});
});
