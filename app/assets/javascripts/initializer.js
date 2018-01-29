// Initializer

bindEvents = function() {
  $(".off").setOff();
  $(".sortable").setSortable();
};

$(document).on( "turbolinks:load", function() {
  bindEvents();
  Turbolinks.clearCache();
});

// $(window).resize(function() {
//   bindEvents();
//   Turbolinks.clearCache();
// });
