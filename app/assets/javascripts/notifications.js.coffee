class Notifications
  constructor: ->
    @notifications = $("[data-behavior= 'notifications']")
    @setup() if @notifications.length > 0

  setup: ->
    $("[data-behavior= 'notifications-link']").on "click", @handleClick
    $.ajax(
      url: "/notifications.json"
      dataType: 'JSON'
      method: 'GET'
      success: @handelSuccess
    )
  handleClick: (e) =>
    $.ajax(
      url: '/notifications/mark_as_read'
      method: "POST"
      dataType: 'JSON'
      success: ->
        $("[data-behavior='unread-count']").text(0)
    )
  handelSuccess: (data) =>
    items= $.map data, (notification) ->
      "<li><a href='#{notification.url}'>#{notification.actor} sent you #{notification.notifiable.type}</a></li>"

    $("[data-behavior='unread-count']").text(items.length)
    $("[data-behavior='notification-items']").html(items)

jQuery ->
  new Notifications
