$ ->
  $(document).on 'hidden', '.modal', (e) ->
    $(this).find('.searchable').select2('destroy')
    $(this).remove()

