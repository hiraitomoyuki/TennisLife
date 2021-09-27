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
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require jquery-ui
//= require activestorage
//= require tag-it
//= require turbolinks
//= require_tree .
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/ja
//= require tagsinput

// クリッカブルマップの領域をレスポンシブにする
$(document).ready(function(e) {
	$('img[usemap]').rwdImageMaps();
});

// プロフィール画像プレビュー機能

$(function(){
    $('#user_image').on('change', function (e) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $(".image").attr('src', e.target.result);
      };
      reader.readAsDataURL(e.target.files[0]);
    });
  });

// 投稿画像プレビュー機能
$(function(){
    $('#article_image').on('change', function (e) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $(".image").attr('src', e.target.result);
      };
      reader.readAsDataURL(e.target.files[0]);
    });
  });

// サークル画像プレビュー機能
$(function(){
    $('#circle_image').on('change', function (e) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $(".image").attr('src', e.target.result);
      };
      reader.readAsDataURL(e.target.files[0]);
    });
  });
