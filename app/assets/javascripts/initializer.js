// Initializer

bindEvents = function() {
  $(".off").altaiOff();
  $(".sortable").altaiSortable();
  $(".altai-center").altaiCenter();
  $("option").each(function() {
    t = $(this).text();
    $(this).text(t.replace(/^(.)|\s(.)/g, function($1){ return $1.toUpperCase( ); }))
  });
};

$(document).on( "turbolinks:load", function() {
  bindEvents();
  Turbolinks.clearCache();
});

// $(window).resize(function() {
//   bindEvents();
//   Turbolinks.clearCache();
// });
