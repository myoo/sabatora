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

    
  setRoomId: () =>
    $('#room_id').val()

  setUserId: () =>
    $('#user_id').val()

  sendBackground: (event) =>
    background_id = $('#background_select').val()

    message = { room_id: @room_id, user_id: @user_id, background_id: background_id }
    @dispatcher.trigger 'background_changed', message

  setBackground: (message) =>
    target = $('#test')
    target.css "background-image", "url(#{message.background_url})"

  setRoomConfig: () =>
    @sendBackground() 

$ ->
  window.roomClass = new RoomClass($('#chat').data('uri'), true)
