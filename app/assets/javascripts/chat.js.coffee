class @ChatClass
  constructor: (url, useWebsocket) ->
    # これがソケットのディスパッチャー
    @dispatcher = new WebSocketRails(url, useWebsocket)
    # イベントを監視
    @bindEvents()
 
  bindEvents: () =>
    # 送信ボタンが押されたらサーバへメッセージを送信
    $('form').on 'submit', (e) =>
      e.preventDefault()
      @sendMessage()
    # サーバーからnew_messageを受け取ったらreceiveMessageを実行
    @dispatcher.bind 'new_message', @receiveMessage

  sendMessage: (event) =>
    # サーバ側にsend_messageのイベントを送信
    # オブジェクトでデータを指定
    user_id = $('#user_id').val()
    user_name = $('#username').text()
    msg_body = $('#chat_message').val()
    @dispatcher.trigger 'new_message', { id: user_id, name: user_name , body: msg_body }
    $('#chat_message').val('')
 
  receiveMessage: (message) =>
    # 受け取ったデータをappend
    $('#chat').append "#{message.name} : #{message.body}<br/>"
    
 
$ ->
  window.chatClass = new ChatClass($('#chat').data('uri'), true)
