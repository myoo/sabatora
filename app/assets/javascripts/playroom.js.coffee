#
# チャットルームのクラス
#

class @PlayRoomClass
  # websocketで状態を同期
  constructor: (url, useWebsocket) ->
    # ソケットのディスパッチャー
    @dispatcher = new WebSocketRails(url, useWebsocket)
    @channelCode = @setChannelCode()
    @channel = @dispatcher.subscribe(@channelCode)
    console.log @channel
    @character_id = $('#character_id').val()

    # canvasサイズ調整
    @setCanvasSize()
    # 立ち絵
    @illustCtr = new IllustrationClass()
    # イベントを監視
    @bindEvents()

  bindEvents: () =>
    # canvasサイズ調整
    $(window).on "resize", _.debounce () =>
        @setCanvasSize()
        @drawPlayspace()
      , 600

    # 立ち絵
    @channel.bind 'illustration_changed', @illustrationChanged

  setChannelCode: () =>
    $('#room_id').val()

  setCanvasSize: () =>
    $('#playspace_container').attr('height', $(window).innerHeight())
    $('#playspace').attr('width', $('#playspace_container').width())
    $('#playspace').attr('height', $('#playspace_container').height())

  drawPlayspace: () =>
    alert "resize!"
    @illustCtr.reDrawIllustrations()

  changeIllustration: (illust_id) =>
    user_id = $('#user_id').val()
    message = {
      user_id: user_id
      room_id: @channelCode
      illustration_id: illust_id
      character_id: @character_id
    }
    @dispatcher.trigger 'illustration_changed', message

  illustrationChanged: (message) =>
    @illustCtr.changeIllustration(message.character_id, message.illustration_id)

#
# 立ち絵
#
class @IllustrationClass
  constructor: () ->
    @container = $('#playspace')
    @character_id = $('#character_id').val()
    @illustNumber = 4    #一度に表示する立ち絵の数
    @getIllustrationsUrl = $(location).attr('pathname') + "/illustrations"
    @character_list = {}
    @active_illusts = {}

    @getIllustrations()

  getIllustrations: () =>
    $.getJSON @getIllustrationsUrl, (data) =>
      id = 0
      for character in data
        @character_list["character_#{id}"]  = { id: character.character_id}
        for illustration in character.illustration_list
          unless @active_illusts["character_#{id}"]?
            @prepareIllustrations(id, illustration)
            @active_illusts["character_#{id}"] = illustration.id
          @character_list["character_#{id}"][illustration.id] = {
            name: illustration.name
            url: illustration.url
          }
        id++

      @setSelectBox()
      console.log @character_list

  setSelectBox: () =>
    $('#illustration_list').children('li').remove()
    layer_name = @_layer_name(@character_id)
    for id, illust of @character_list[layer_name]
      unless id == 'id'     # キャラクターIDが含まれているので避ける
        $('#illustration_list').append($('<li />').append($('<a />', {
          'href': '#'
          'data-val': id
          'text': illust.name
          })))
    $('#illustration_list a').on "click", (e) ->
      e.preventDefault()
      window.playRoomClass.changeIllustration($(this).data('val'))
      $('#illustration_list a').removeClass('active')
      $(this).addClass('active')
    $('[data-val="' + @active_illusts[layer_name] + '"]').addClass('active')


  prepareIllustrations: (id, data) =>
    @container.drawImage({
      layer: true
      name: "character_#{id}"
      source: data.url
      x: @_calx(id), y: @_caly()
      height: @_calh()
      width: @_calw()
      fromCenter: false
      })

  reDrawIllustrations: () =>
    for layer_name, illustrations of @character_list
      @_set_illustration(layer_name, illustrations)
    @container.drawLayers()

  changeIllustration: (character_id, illust_id) =>
    layer_name = @_layer_name(character_id)
    @active_illusts[layer_name] = illust_id
    @_set_illustration(layer_name, @character_list[layer_name])
    @container.drawLayers()

  _caly: () =>
    @container.attr('height') - @_calh()

  _calx: (id) =>
    (@container.attr('width') / @illustNumber) * id

  _calh: () =>
    @container.attr('height') * 0.9

  _calw: () =>
    @_calh() / 2

  _layer_name: (character_id) =>
    for layer_name, data of @character_list
      if data.id == parseInt(character_id, 10)
        return layer_name

  _get_id: (layer_name) =>
    id = /(\d+)/.exec(layer_name)[0]

  _set_illustration: (layer_name, illustrations) =>
    id = @_get_id(layer_name)
    @container.setLayer layer_name, {
      source: illustrations[@active_illusts[layer_name]].url
      x: @_calx(id), y: @_caly()
      height: @_calh()
      width: @_calw()
      fromCenter: false
    }