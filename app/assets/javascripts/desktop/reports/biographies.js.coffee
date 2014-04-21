# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    $("#judge_biography").bind 'input propertychange', ->
        words = this.value.match(/[^\s-]+/g)
        count = words && words.length || 0
        if count == 1
            text = "word"
        else
            text = "words"
        $("#word_count").html(count + " " + text)
