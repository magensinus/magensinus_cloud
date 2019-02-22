// Initializer

bindEvents = function() {
  $(".off").altaiOff();
  $(".sortable").altaiSortable();
  $(".altai-center").altaiCenter();
  $("option").each(function() {
    t = $(this).text();
    $(this).text(t.replace(/^(.)|\s(.)/g, function($1){ return $1.toUpperCase( ); }))
  });
  // File uploads
  // Need to pass this into a package.
  $("[type=file]").on("change", function(){
    var file = this.files[0].name;
    var dflt = $(this).attr("placeholder");
    if($(this).val()!=""){
      $(this).next().text(file);
    } else {
      $(this).next().text(dflt);
    }
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
