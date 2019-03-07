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

//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap-sprockets
//= require_tree ../../../app/assets/javascripts/.
//= require activestorage
//= require_tree .
//= require cocoon

$(function() {
    $(document).on('turbolinks:load',function() {
  $('.menu-trigger').on('click', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
  });
 });
});

$(function(){
$(document).on('turbolinks:load',function() {
// オプションを指定してSkipprの実行
$("#theTarget").skippr({
    // スライドショーの変化 ("fade" or "slide")
    transition : 'slide',
    // 変化に係る時間(ミリ秒)
    speed : 1000,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形("block" or "bubble")
    navType : 'block',
    // 子要素の種類("div" or "img")
    childrenElementType : 'div',
    // ナビゲーション矢印の表示(trueで表示)
    arrows : true,
    // スライドショーの自動再生(falseで自動再生なし)
    autoPlay : true,
    // 自動再生時のスライド切替間隔(ミリ秒)
    autoPlayDuration : 1000,
    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
    keyboardOnAlways : true,
    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
    hidePrevious : false
});
});

});
 $(function() {
    $(document).on("ajax:success", ".fav", function(e) {
        console.log('ajax成功');

      if ($('#' + e.detail[0]).hasClass('glyphicon glyphicon-heart')) {
         let a=$(".iine").html();
         $(".iine").html(Number(a)-1);
        $('#' + e.detail[0]).removeClass('glyphicon glyphicon-heart').addClass('glyphicon glyphicon-heart-empty');
      } else {
         let a=$(".iine").html();
         $(".iine").html(Number(a)+1);
         console.log('glyphicon-heart-emptyある。');
    $('#' + e.detail[0]).removeClass('glyphicon glyphicon-heart-empty').addClass('glyphicon glyphicon-heart');
      }
    })
  })