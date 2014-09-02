class @ChatClass
  constructor: (url, useWebsocket) ->
    # これがソケットのディスパッチャー
    @dispatcher = new WebSocketRails(url, useWebsocket)
    @channelCode = @setChannelCode()
    @channel = @dispatcher.subscribe(@channelCode)
    @userChannelKey = $('#user_channel_key').val()
    @privateChannel = @dispatcher.subscribe(@userChannelKey)
    # イベントを監視
    @bindEvents()
    @dispatcher.trigger 'enter_room', { room_id: @channelCode }
    
  bindEvents: () =>
    # 送信ボタンが押されたらサーバへメッセージを送信
    $('form#chat_form').on 'submit', (e) =>
      e.preventDefault()
      @sendMessage()
    # サーバーからnew_messageを受け取ったらreceiveMessageを実行
    @dispatcher.bind 'new_message', @receiveSystemMessage
    @channel.bind 'room_message', @receiveMessage
    @privateChannel.bind 'new_message', @receivePrivateMessage
  
  setChannelCode: () =>
    $('#room_id').val() unless at_user?

  sendMessage: (event) =>
    # サーバ側にsend_messageのイベントを送信
    # オブジェクトでデータを指定
    user_id = $('#user_id').val()
    user_name = $('#username').text()
    msg_body = $('#chat_message').val()
    message =  { room_id: @channelCode, user_id: user_id, user_name: user_name , body: msg_body }

    if at_user = $('#chat_message').val().match(/^@.+\s|^@.+$/)    # 個人チャット
      @dispatcher.trigger 'private_message', message
    else
      # @dispatcher.trigger 'new_message', message
      @dispatcher.trigger 'room_message', message

    $('#chat_message').val('')
 
  

  receiveMessage: (message) =>
    # 受け取ったデータをappend
    $('#chat').append "<dt>#{message.user_name} :</dt> <dd>#{message.body}</dd>"
    height = 0
    $('#chat dd').each ->
      height += $(this).height()
    $('#chat dt').each ->
      height += $(this).height()
    $('#chat').scrollTo('+=100px', 500)

  receivePrivateMessage: (message) =>
    # 受け取ったデータをappend
    $('#chat').append "<dt class='private'>#{message.user_name} :</dt> <dd>#{message.body}</dd>"
    $('#chat').scrollTo('+=100px', 500)

  receiveSystemMessage: (message) =>
    # 受け取ったデータをappend
    $('#chat').append "<dt class='system'>#{message.user_name} :</dt> <dd>#{message.body}</dd>"
    $('#chat').stop().scrollTo('100%', 1500)

$ ->
  window.chatClass = new ChatClass($('#chat').data('uri'), true)
  console.log("chat ready")

