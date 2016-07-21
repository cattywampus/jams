$ ->
  $(document).on 'hidden.bs.modal', '.modal', (e) ->
    $(this).find('.searchable').select2('destroy')
    $(this).remove()

