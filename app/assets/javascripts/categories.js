$(document).ready(function() {

  // var currentParams = window.location.href.split('?').splice(1, 5).toString().split('&');
  var currentParams = [ window.location.href.split('?')[1] ] || ''
  // $("#brand > option").each(function() {
  //   if (this.value == queryString) {
  //     this.selected = 'selected';
  //   }
  // });

  $('#brand, #color, #size' ).on('change', function () {
    var filter = $(this).val();
    if ( currentParams != '') {
      var filterTitle = filter.split('=')[0].split('?')[1];
      $.each( currentParams, function(index, param) {
        if ( param.indexOf(filterTitle) >= 0 ) {
          var paramsSplited = currentParams.toString();
          if (paramsSplited.split('=').length == 2) {
          currentParams.splice(currentParams.indexOf(param), 1);
          window.location = filter + 'One';
          }
          else {
            var newParams = paramsSplited.split('&')
            newParams.splice(newParams.indexOf(param), 1);
            window.location = filter + 'Many' + '&' + newParams;
          };
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