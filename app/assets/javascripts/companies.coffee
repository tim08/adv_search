# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("[name='company[phone_contact]']").mask('+7 (000) 000-00-00');
  $("#account_info").tooltip();
