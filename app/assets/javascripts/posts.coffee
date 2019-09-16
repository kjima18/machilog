$(document).on 'change', '#post_prefecture_id', ->
　$.ajax(
  　type:　'GET',
　  url:　'/posts/get_cities'
　  data: {
      prefecture_id: $(this).val()
    }
  ).done (data) ->
    $('.cities-area').html(data)
