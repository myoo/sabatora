/**
 * A jQuery plugin for auto growing textareas
 * https://github.com/loonkwil/auto-growing-textarea
 */
(function(window, undefined) {
  "use strict";

  var $ = window.jQuery;

  /**
   * @type {Object}
   */
  var defaultOptions = {
    recalculateOnResize: true,
    highlight: null
  };

  /**
   * @param {string} str
   * @return {string}
   */
  var escape = function(str) {
    return str.
      replace(/&/g, '&amp;').
      replace(/>/g, '&gt;').
      replace(/</g, '&lt;');
  };

  /**
   * @param {jQuery} $textarea
   * @param {function(string): string} highlight
   * @param {boolean} syncHtml
   */
  var fixAutoGrowingContent = function($textarea, highlight, syncHtml) {
    if( syncHtml === undefined ) { syncHtml = true; }
    var $shadow = $textarea.siblings('.auto-growing-editor');

    if( syncHtml ) {
      var text = $textarea.val();
      text = (typeof highlight === 'function') ? highlight(text) : escape(text);
      $shadow.html(text);
    }

    $shadow.css('height', 'auto');

    var height = Math.max(
      $shadow.css('height').replace('px', ''),
      $textarea.data('minHeight')
    );

    $textarea.css('height', height);
    var scrollHeight = $textarea.prop('scrollHeight');
    if( scrollHeight > height ) {
      height = scrollHeight;
      $textarea.css('height', height);
    }

    $shadow.css('height', height);
  };

  /**
   * @param {jQuery} $textareas
   * @param {function(string): string} highlight
   * @param {boolean} syncHtml
   */
  var fixAutoGrowingContents = function($textareas, highlight, syncHtml) {
    var l = $textareas.length;
    for( var i = 0; i < l; ++i ) {
      fixAutoGrowingContent($textareas.eq(i), highlight, syncHtml);
    }
  };


  /**
   * @param {{ recalculateOnResize: boolean, highlight: function }} options
   * @return {jQuery}
   */
  $.fn.autoGrow = function(options) {
    options = $.extend({}, defaultOptions, options);

    var $textareas = this;

    // window resize event
    if( options.recalculateOnResize ) {
      var queued = false;
      var windowResizeEvent = function() {
        if( queued ) { return; }
        queued = true;

        window.setTimeout(function() {
          fixAutoGrowingContents($textareas, options.highlight, false);
          queued = false;
        }, 100);
      };

      $(window).on('resize', windowResizeEvent);
    }

    return $textareas.each(function() {
      var $textarea = $(this).addClass('auto-growing-editor');

      var hasFocus = $textarea.is(':focus');

      var minHeight = $textarea.height();
      $textarea.data('minHeight', minHeight);

      var $shadow = $('<pre />', {
        'class': 'auto-growing-editor'
      });

      $textarea.
        wrap('<div />').
        parent().
        addClass('auto-growing-editor-container').
        append($shadow);

      // Fixing iOS Safari bug
      // http://stackoverflow.com/questions/6890149/remove-3-pixels-in-ios-webkit-textarea
      if( /iPhone|iPad/i.test(navigator.userAgent) ) {
        $shadow.css({paddingLeft: '+=3px', paddingRight: '+=3px'});
      }

      fixAutoGrowingContent($textarea, options.highlight);

      if( hasFocus ) {
        $textarea.focus();
      }

      // events
      $textarea.on('input', function() {
        fixAutoGrowingContent($textarea, options.highlight);
      });
    });
  };
}(window));
