$(document).ready(function() {
  $('#brand, #color, #size' ).on('change', function () {
    $('#filter-form').submit();   
  });
});