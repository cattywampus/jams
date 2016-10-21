# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    $("#judge_person_id").select2({
        ajax: {
            url: $("#judge_person_id").data("query")
            dataType: "json"
            data: (term, page) -> { name: term, page: page }
            results: (data, page) -> { results: data }
        },
        initSelection: (element, callback) ->
            id = $(element).val()
            $.ajax($("#judge_person_id").data("person"), {dataType: "json"}).done((data) -> callback(data))
        })

$ ->
  $(document).on "click", "#judge_potential_judge_advisor, #judge_invite_to_championship", (e) ->
    checked_invite = $("#judge_invite_to_championship").is(":checked")
    checked_ja = $("#judge_potential_judge_advisor").is(":checked")
    $("#judge_blacklisted").prop("disabled", checked_invite || checked_ja).prop("checked", false)

  $(document).on "change", "#judge_blacklisted", (e) ->
    checked = $(this).prop("checked")
    elements = $("#judge_potential_judge_advisor, #judge_invite_to_championship")
    elements.prop("disabled", checked).prop("checked", false)

