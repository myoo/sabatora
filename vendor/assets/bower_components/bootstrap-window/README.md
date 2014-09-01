# bootstrap-window [![Build Status](https://secure.travis-ci.org/earmbrust/bootstrap-window.png?branch=master)](http://travis-ci.org/earmbrust/bootstrap-window)

> bootstrap-window is a bootstrap 3.0.0 compatible window and window management solution.  bootstrap-window provides the ability to create event driven windows based on the bootstrap styles.



## Getting Started
This project requires Grunt `~0.4.0`
If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

### Building
To build bootstrap-window, you must first change to the project directory and install the necessary dependencies:
<pre>npm install</pre>

Then, you will need to run the grunt build:
<pre>grunt</pre>

Once these processes have been completed, you will find the built bootstrap-window sources in the `dist` directory.

### Installing
bootstrap-window may be easily installed using the bower package manager by Twitter.
Please see the instructions for [installing bower](http://bower.io/#installing-bower) to get started.
Once you have installed bower and read the [installing bower packages](http://bower.io/#installing-packages-and-dependencies) section, you can install bootstrap-window by running:
<pre>
bower install bootstrap-window
</pre>

### Basic Usage
Below is an example of using bootstrap-window programmatically.

#### Standalone Window
Creating a standalone Window, a Window that has no attachment to a WindowManager, only takes a few parameters to get up and running.
```javascript
var exampleWindow = new Window({
    template: $('#template_element').html(),
    title: "Bootstrap Window",
    bodyContent: "some body content",
    footerContent: '<button type="button" class="btn btn-default" data-dismiss="window">Close</button><button type="button" class="btn btn-primary">Submit</button>'
});
```
#### WindowManager and managed Windows
First, you'll need to create a new WindowManager.
```javascript
var windowManager = new WindowManager({
    container: "#windowPane",
    windowTemplate: $('#template_element').html()
});
```

Once you have created the WindowManager, you can create Windows using the factory method.
```javascript
var exampleWindow = windowManager.createWindow({
    title: "Bootstrap Window",
    bodyContent: "some body content",
    footerContent: '<button type="button" class="btn btn-default" data-dismiss="window">Close</button><button type="button" class="btn btn-primary">Submit</button>'
});
```


#### Quick Window
Quick Windows can be created via a simple markup API.

```html
<a class="btn" data-window-target="#windowElementSelector" data-window-title="Window Title" data-window-handle=".handleSelector" data-title-handle=".titleSelector">
```
## Release History
 * 2013-11-04   v0.2.2  Fix for quick windows not being draggable, fix for quick window titles not displaying
 * 2013-11-04   v0.2.1  Fix for responsive windows on orientation change
 * 2013-11-04   v0.2.0  Windows are now responsive!
 * 2013-11-03   v0.1.1  Added support for the jQuery Plugin site
 * 2013-10-29   v0.1.0  Added parent/child window relationship, started adding window resizing
 * 2013-10-29   v0.0.8  Refactored WindowManager class to better use prototype inheritance
 * 2013-10-29   v0.0.7  Major refactorization of Window class to use prototype inheritance, Added unit tests for Window class, Updated README
 * 2013-10-28   v0.0.6  Improved versioning in preparation for initial minor release, windows now fade to match the normal bootstrap modal
 * 2013-10-28   v0.0.5  Updated to add readme and improve details
 * 2013-10-28   v0.0.4  Minor updates
 * 2013-10-28   v0.0.3  First public source release


---

bootstrap-window is created and maintained by [Elden Armbrust](http://www.linkedin.com/in/eldenarmbrust)
