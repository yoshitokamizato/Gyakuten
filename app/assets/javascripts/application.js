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
//= require jquery3
//= require popper
//= require bootstrap-sprockets

// テキスト教材ページ - 検索フォーム内の処理
$(document).on('turbolinks:load', function () {
    var searchWord = function () {
        var searchText = $(this).val().toLowerCase(), // 検索ボックスに入力された値
            targetText;

        $('p.text-title').each(function () {
            targetText = $(this).text().toLowerCase();

            // 検索対象となるリストに入力された文字列が存在するかどうかを判断
            if (targetText.indexOf(searchText) != -1) {
                $(this).parents('div.text-card-container').removeClass('d-none');
            } else {
                $(this).parents('div.text-card-container').addClass('d-none');
            }
        });
    };

    // searchWordの実行
    $('#search-text').on('input', searchWord);
});