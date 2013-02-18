# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    Morris.Bar({
        element: "mens-shirts-graph",
        data: $("#mens-shirts-graph").data("shirts"),
        xkey: 'size',
        ykeys: ['count'],
        labels: ['Shirts']
        })

    Morris.Bar({
        element: 'womens-shirts-graph',
        data: $('#womens-shirts-graph').data('shirts'),
        xkey: 'size',
        ykeys: ['count'],
        labels: ['Shirts']
        })
