jQuery(document).on 'turbolinks:load', ->
  comments = $('#comments')

  if comments.length > 0
    # create subscription for blogschannel on blog
    App.global_chat = App.cable.subscriptions.create {
      channel: "BlogsChannel"
      blog_id: comments.data('blog-id')
    },
    connected: ->
    disconnected: ->
    # append comments to list
    received: (data) ->
      comments.append data['comment']
    # send comment via perform method
    send_comment: (comment, blog_id) ->
      @perform 'send_comment', comment: comment, blog_id: blog_id

  $('#new_comment').submit (e) ->
    $this = $(this)
    textarea = $this.find('#comment_content')
    if $.trim(textarea.val()).length > 1
      App.global_chat.send_comment textarea.val(), comments.data('blog-id')
      textarea.val('')
    e.preventDefault()
    return false