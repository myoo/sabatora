var WindowManager = null;
(function($) {
    "use strict";
    WindowManager = function(options) {
        this.windows = [];
        options = options || {};
        this.initialize(options);
        return this;
    };

    WindowManager.prototype.findWindowByID = function(id) {
        var returnValue = null;
        $.each(this.windows, function(index, window) {
            console.log(arguments);
            if (window.id === id) {
                returnValue = window;
            }
        });
        return returnValue;
    };

    WindowManager.prototype.destroyWindow = function(window_handle) {
        var _this = this;
        $.each(this.windows, function(index, window) {
            if (window === window_handle) {
                _this.windows.splice(index, 1);
                _this.resortWindows();
            }
        });
    };

    WindowManager.prototype.resortWindows = function() {
        var startZIndex = 900;
        $.each(this.windows, function(index, window) {

            window.setIndex(startZIndex + index);
        });
    };

    WindowManager.prototype.setFocused = function(focused_window) {
        var focusedWindowIndex;
        while (focused_window.getBlocker()) {
            focused_window = focused_window.getBlocker();
        }
        $.each(this.windows, function(index, windowHandle) {
            windowHandle.setActive(false);
            if (windowHandle === focused_window) {
                focusedWindowIndex = index;
            }
        });
        this.windows.push(this.windows.splice(focusedWindowIndex, 1)[0]);
        

        focused_window.setActive(true);
        this.resortWindows();

    };

    WindowManager.prototype.initialize = function(options) {
        this.options = options;
        if (this.options.container) {
            $(this.options.container).addClass('window-pane');
        }
    };

    WindowManager.prototype.setNextFocused = function () {
        this.setFocused(this.windows[this.windows.length-1]);
    };

    WindowManager.prototype.addWindow = function(window_object) {
        var _this = this;
        window_object.getElement().on('focused', function(event) {
            _this.setFocused(window_object);
        });
        window_object.getElement().on('close', function() {
            _this.destroyWindow(window_object);
            if (window_object.getWindowTab()) {
                window_object.getWindowTab().remove();
            }

        });

        if (this.options.container) {
            window_object.setWindowTab($('<span class="label label-default">' + window_object.getTitle() + '<button class="close">x</button></span>'));
            window_object.getWindowTab().find('.close').on('click', function(event) {
                window_object.close();
            });
            window_object.getWindowTab().on('click', function(event) {
                _this.setFocused(window_object);
                if (window_object.getSticky()) {
                    window.scrollTo(0, window_object.getElement().position().top);
                }

            });

            $(this.options.container).append(window_object.getWindowTab());
        }

        this.windows.push(window_object);
        window_object.setManager(this);
        this.setFocused(window_object);
        return window_object;
    };

    WindowManager.prototype.createWindow = function(window_options) {
        var _this = this;
        var final_options = Object.create(window_options);
        if (this.options.windowTemplate && !final_options.template) {
            final_options.template = this.options.windowTemplate;
        }

        var newWindow = new Window(final_options);
        
        
        return this.addWindow(newWindow);
    };
}(jQuery));
