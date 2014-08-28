class @RoomClass
  constructor: (url, useWebsocket) ->
    console.log("initialized")
    @room_id = @setRoomId()
    @user_id = @setUserId()
    @dispatcher = new WebSocketRails(url, useWebsocket)
    @channel = @dispatcher.subscribe("room_#{@room_id}")
    @setRoomConfig()
    @bindEvents()

  bindEvents: () =>
    # 背景変更
    $('#background_select').on 'change', (e) =>
      @sendBackground()
    @channel.bind 'background_changed', @setBackground
    # 背景高さ調整
    $(window).resize @canvasResize

    
  setRoomId: () =>
    $('#room_id').val()

  setUserId: () =>
    $('#user_id').val()

  sendBackground: (event) =>
    background_id = $('#background_select').val()

    message = { room_id: @room_id, user_id: @user_id, background_id: background_id }
    @dispatcher.trigger 'background_changed', message
    console.log("background change")

  setBackground: (message) =>
    target = $('#background')
    console.log(message.background_url)
    target.css "background-image", "url(#{message.background_url})"

  setRoomConfig: () =>
    @sendBackground()
    @canvasResize()

  canvasResize: () =>
    $('#content').css "min-height", $(window).height() - 50
    $('#chat').css "height", $(window).height() * 0.6
    $(window).scrollTop = $(window).scrollHeight

$ ->
  window.roomClass = new RoomClass($('#chat').data('uri'), true)
