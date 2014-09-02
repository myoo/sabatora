# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
# Bootstrap-window
class @ChatLogClass
  constructor: () ->
    # wm = new WindowManager({
    #   container: "#windowPane",
    #   windowTemplate: $('#basic_window_template').html()
    # })
    # window.wm = wm
    @bindEvents()

  bindEvents: () =>
    @setMainChatLog()

  setMainChatLog: () =>
    $("#main_chat_log").on 'show.bs.collapse', (e) =>
      $.ajax "#{$(location).attr('pathname')}/main_chat_log",
        type: 'get',
        success: (data) =>
          $("#main_chat_log").html @parseLog(data)

    # $('.main_chat_log').on 'click', (event) =>
    #   event.preventDefault()
    #   # データ取得
    #   $.ajax "#{$(location).attr('pathname')}/main_chat_log",
    #     type: 'get',
    #     success: (data) =>
    #       body = @parseLog(data)
    #       wm.createWindow({
    #         title: "メインチャットログ",
    #         bodyContent: body,
    #         resizable: true,
    #         footerContent: '<button type="button" class="btn btn-default" data-dismiss="window">Close</button>'
    #       })

  parseLog: (data) ->
    buf = "<dl>"
    for line in data
      buf += "<dt>#{line.user_name}</dt><dd>#{line.body}</dd>"
    buf += "</dl>"


$ ->
  window.chatLogClass = new ChatLogClass()
