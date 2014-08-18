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
    $('form').on 'submit', (e) =>
      e.preventDefault()
      @sendMessage()
    # サーバーからnew_messageを受け取ったらreceiveMessageを実行
    @dispatcher.bind 'new_message', @receiveMessage
    @channel.bind 'new_message', @receiveSystemMessage
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

    # 個人チャット
    if at_user = $('#chat_message').val().match(/^@.+\s|^@.+$/)
      @dispatcher.trigger 'private_message', message
    else
      @dispatcher.trigger 'new_message', message
      @channel.trigger 'new_message', message

    $('#chat_message').val('')
 
  receiveMessage: (message) =>
    # 受け取ったデータをappend
    $('#chat').append "<dt>#{message.user_name} :</dt> <dd>#{message.body}</dd>"
    height = 0
    $('#chat dd').each ->
      height += $(this).height()
    $('#chat dt').each ->
      height += $(this).height()
    console.log height 
    $('#chat').scrollTo('+=400', $('#chat').offset().top + height)
    console.log($('#chat').offset().top)

  receivePrivateMessage: (message) =>
    # 受け取ったデータをappend
    $('#chat').append "<DT class='private'>#{message.user_name} :</DT> <DD>#{message.body}</DD>"

  receiveSystemMessage: (message) =>
    # 受け取ったデータをappend
    $('#chat').append "<DT class='system'>#{message.user_name} :</DT> <DD>#{message.body}</DD>"    

$ ->
  window.chatClass = new ChatClass($('#chat').data('uri'), true)
