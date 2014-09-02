(function ($) {
    var win,
        testing_options = {
            template: $('#template').html(),
            title: "Basic Window",
            bodyContent: "<p>One fine body...</p>",
            footerContent: '<button type="button" class="btn btn-default" data-dismiss="window">Close</button><button type="button" class="btn btn-primary">Save changes</button>'
        };

    module( "Basic Window Tests" );
    test('Class Test', function() {
        expect(1);
        ok(!!Window, 'Window class exists');
    });
    test('Can instantiate Window class', function () {
        expect(1);
        win = new Window({template: "empty"});
        ok(win instanceof Window, "Window instantiates properly");
    });

    module("Method tests", {
        setup: function() {
            win = new Window(testing_options);
        }, teardown: function() {
            win.close();
            win = null;
        }
    });
    test('getElement', function () {
        expect(2);
        ok(win instanceof Window, "Window instantiated properly");
        ok(win.getElement() instanceof jQuery, "getElement() returns the jQuery object");
    });

    test('setSticky', function () {
        ok(typeof win.options.sticky === "undefined", "sticky mode not set by default");
        win.setSticky(true);
        ok(win.options.sticky === true, "setSticky() properly sets sticky mode: true");
        ok(win.getElement().css('position') === 'fixed', 'getSticky() properly sets css attribute: true');
        win.setSticky(false);
        ok(win.options.sticky === false, "setSticky() properly sets sticky mode: false");
        ok(win.getElement().css('position') === 'absolute', 'getSticky() properly sets css attribute: false');
    });

    test('getSticky', function () {
        ok(typeof win.getSticky() === "undefined", "sticky mode not set by default");
        win.setSticky(true);
        ok(win.getSticky() === true, "getSticky() properly retrieves sticky mode: true");

        win.setSticky(false);
        ok(win.getSticky() === false, "getSticky() properly retrieves sticky mode: false");
    });
}(jQuery));