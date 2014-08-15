class @ChatClass
  constructor: (url, useWebsocket) ->
    # これがソケットのディスパッチャー
    @dispatcher = new WebSocketRails(url, useWebsocket)
    @channelCode = @setChannelCode()
    @channel = @dispatcher.subscribe(@channelCode)
    # イベントを監視
    @bindEvents()
    # 入室イベント
    @dispatcher.trigger 'enter_room', { room_id: @channelCode }

 
  bindEvents: () =>
    # 送信ボタンが押されたらサーバへメッセージを送信
    $('form').on 'submit', (e) =>
      e.preventDefault()
      @sendMessage()
    # サーバーからnew_messageを受け取ったらreceiveMessageを実行
    @channel.bind 'new_message', @receiveMessage

  setChannelCode: () =>
    $('#room_id').val()

  sendMessage: (event) =>
    # サーバ側にsend_messageのイベントを送信
    # オブジェクトでデータを指定
    user_id = $('#user_id').val()
    user_name = $('#username').text()
    msg_body = $('#chat_message').val()

    message =  { room_id: @channelCode, user_id: user_id, user_name: user_name , body: msg_body }

    @dispatcher.trigger 'new_message', message
    @channel.trigger 'new_message', message
    $('#chat_message').val('')
 
  receiveMessage: (message) =>
    # 受け取ったデータをappend
    $('#chat').append "#{message.user_name} : #{message.body}<br/>"
    
 
$ ->
  window.chatClass = new ChatClass($('#chat').data('uri'), true)
