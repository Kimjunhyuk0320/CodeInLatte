$(document).ready(function() {
   $('body').addClass('d-flex flex-column min-vh-100');
   
   $(".minus").click(function() {
      event.preventDefault();
        var input = $("#quantityInput");
        if (input.val() < input.attr('max')) {
            input.val(parseInt(input.val()) - 1);
        }
        if(input.val() <= 1) {
         input.val(1);
      }
    });

    $(".plus").click(function() {
      event.preventDefault();
        var input = $("#quantityInput");
        if (input.val() >= input.attr('min')) {
            input.val(parseInt(input.val()) + 1);
        }
        if(input.val() <= 1) {
         input.val(1);
      }
    });
}); 