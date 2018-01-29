/*
* Name: set_sortable
* Title: Set Sortable
* Version: v1.0.0
* Description: Reorder elements in a list or grid.
*
*/

(function($, window, document) {
  $.fn.extend({
    setSortable: function(options) {
      var action, log, object, settings;
      object = $(this);
      settings = {
        debug: false
      };
      settings = $.extend(settings, options);
      log = function(message) {
        if (settings.debug) {
          typeof (console === "undefined" && console === null) ? console.log(message) : void 0;
        } else {
          void 0;
        }
      };
      action = function() {
        object.each(function() {
          $(this).sortable({
            axis: "y",
            cursor: "move",
            option: "grid",
            handle: ".handle",
            update: function(e, ui) {
              Rails.ajax({
                url: object.data("url"),
                type: "PATCH",
                data: object.sortable("serialize")
              });
            }
          });
        });
      };
      if (object.length > 0) {
        this.each(function() {
          action();
          log("Sortable Activated");
        });
      }
    }
  });
})(jQuery, window, document);
