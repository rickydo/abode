$(document).ready(function(){
  $('form#new_expense').on("submit", function(event) {
    event.preventDefault();
    var action = $(this).attr('action');
    var data = $(this).serialize();
    request = $.ajax(action, {method: "post", data: data});
    debugger;

  })
});
