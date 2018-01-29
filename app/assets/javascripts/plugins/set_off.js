/*
* Name: set_off
* Title: Set Off
* Version: v1.0.0
* Description: Disable anchor href attributes.
*
*/

(function($, window, document) {
  $.fn.extend({
    setOff: function(options) {
      var action, log, object, settings;
      object = $(this);
      settings = {
        debug: true
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
          $(this).on("click", function(e) {
            e.preventDefault();
          });
        });
      };
      if (object.length > 0) {
        this.each(function() {
          action();
          log("Off Activated");
        });
      }
    }
  });
})(jQuery, window, document);
