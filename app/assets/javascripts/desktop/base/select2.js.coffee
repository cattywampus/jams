@initialize_select2 = (root, options) ->
  $(root).find("input[type=hidden].select2").each (index, element) ->
    default_options = {
      minimumInputLength: 1
      ajax: {
        url: $(element).data("remote")
        dataType: "json"
        data: (term, page) -> { q: term, page: page }
        results: (data, page) -> { results: data }
      }
      initSelection: (control, callback) ->
        id = $(control).val()
        $.ajax($(element).data('lookup'), {dataType: "json"}).done((data) -> callback(data)) if id
    }
    options = $.extend(default_options, options)
    $(element).select2 options

