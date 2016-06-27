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
      var params = currentParams.toString().split('&');
      $.each( params, function(index, param) {
        if ( param.indexOf(filterTitle) >= 0 ) {
          if (params.length == 1) {
          params.splice(params.indexOf(param), 1);
          window.location = filter + 'One';
          }
          else {
            params.splice(params.indexOf(param), 1);
            window.location = filter + 'Many' + '&' + params;
          };
        }
        else {
          window.location = filter + 'newFilter' + '&'  + params;
        };
      });
    }
    else {
      window.location = filter;
    };    
  });
});