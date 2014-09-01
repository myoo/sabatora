# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # Bootstrap-window
  wm = new WindowManager({
    container: "#windowPane",
    windowTemplate: $('#basic_window_template').html()
  })
  window.wm = wm

  $('.main_chat_log').on 'click',  (event) ->
    alert "test"
    event.preventDefault()
    wm.createWindow({
      title: "Basic Window #",
      bodyContent: "<p>One fine body...</p>",
      footerContent: '<button type="button" class="btn btn-default" data-dismiss="window">Close</button><button type="button" class="btn btn-primary">Save changes</button>'
    })
