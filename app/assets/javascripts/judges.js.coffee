# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    $("#judge_person_id").select2({
        ajax: {
            url: $("#judge_person_id").data("query")
            dataType: "json"
            data: (term, page) -> { name: term, page: page }
            results: (data, page) -> { results: data["events"] }
        },
        initSelection: (element, callback) ->
            id = $(element).val()
            $.ajax($("#judge_person_id").data("person"), {dataType: "json"}).done((data) -> callback(data))
        })
