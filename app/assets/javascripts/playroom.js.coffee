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

  setChannelCode: () =>
    $('#room_id').val()

  setCanvasSize: () =>
    $('#playspace_container').attr('height', $(window).innerHeight())
    $('#playspace').attr('width', $('#playspace_container').width())
    $('#playspace').attr('height', $('#playspace_container').height())

  drawPlayspace: () =>
    alert "resize!"
    @illustCtr.reDrawIllustrations()


#
# 立ち絵
#
class @IllustrationClass
  constructor: () ->
    @container = $('#playspace')
    @illustNumber = 4    #一度に表示する立ち絵の数
    @getIllustrationsUrl = $(location).attr('pathname') + "/illustrations"
    @character_list = {}
    @active_illusts = {}
    @getIllustrations()


  getIllustrations: () =>
    $.getJSON @getIllustrationsUrl, (data) =>
      id = 0
      for character in data
        @character_list["character_#{id}"]  = {}
        for illustration in character.illustration_list
          unless @active_illusts["character_#{id}"]?
            @prepareIllustrations(id, illustration)
            @active_illusts["character_#{id}"] = illustration.id
          @character_list["character_#{id}"][illustration.id] = illustration.url
        id++
      console.log @character_list

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
      id = /(\d+)/.exec(layer_name)[0]
      @container.setLayer layer_name, {
        source: illustrations[@active_illusts[layer_name]]
        x: @_calx(id), y: @_caly()
        height: @_calh()
        width: @_calw()
        fromCenter: false
      }
    @container.drawLayers()

  _caly: () =>
    @container.attr('height') - @_calh()

  _calx: (id) =>
    (@container.attr('width') / @illustNumber) * id

  _calh: () =>
    @container.attr('height') * 0.9

  _calw: () =>
    @_calh() / 2
