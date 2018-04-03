// Initializer

bindEvents = function() {
  $(".off").altaiOff();
  $(".sortable").altaiSortable();
};

$(document).on( "turbolinks:load", function() {
  bindEvents();
  Turbolinks.clearCache();
});

// $(window).resize(function() {
//   bindEvents();
//   Turbolinks.clearCache();
// });
