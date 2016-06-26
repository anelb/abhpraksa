$(document).ready(function() {

  var currentParams = window.location.href.split('?').splice(1, 4);
  
  // $("#brand > option").each(function() {
  //   if (this.value == queryString) {
  //     this.selected = 'selected';
  //   }
  // });

  $('#brand, #color, #size' ).on('change', function () {
    var filter = $(this).val();
    if ( currentParams.length > 0) {
      var splitByDelimiter = currentParams.toString().split('&');
      $.each( splitByDelimiter, function(index, param) {
        var filterTitle = filter.split('=')[0].split('?')[1];
        if ( param.indexOf(filterTitle) >= 0 ) {
          splitByDelimiter.splice(splitByDelimiter.indexOf(param), 1).join('&');
          window.location = filter + '&' + splitByDelimiter.join('&')
        }
        else {
          window.location = filter + '&' + currentParams;
        };
      });
    }
    else {
      window.location = filter;
    };
        
  });
});