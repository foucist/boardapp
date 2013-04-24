# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $(".new_status").on("ajax:success", (e, data, status, xhr) ->
    $(".status_list").append xhr.responseText
    $("#status_entry").val("")
    container = $('.statuses')
    scrollTo = $('.status_list ul li:last')
    container.animate({ scrollTop: scrollTo.offset().top - container.offset().top + container.scrollTop() }, 600)
    scrollTo.effect("highlight", {}, 3000)
  ).bind "ajax:error", (e, xhr, status, error) ->
    $(".status_list").prepend xhr.responseText
