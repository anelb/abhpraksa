$(document).ready(function() {

  var currentParams = window.location.href.split('?').splice(1, 4);
  // var currentParams = ["brand=converse&color=red&size=36"]
  // console.log(currentParams);
  // if ( currentParams.length > 0) {
  //   var filter = '?brand=nike'
  //   var paramsWithDelimiter = currentParams.toString().split('&');
  //   console.log(paramsWithDelimiter)
  //   $.each( paramsWithDelimiter, function(index, param) {
  //     var newFilter = filter.split('=')[0].split('?')[1]
  //     if ( param.indexOf(newFilter) >= 0 ) {
  //       console.log("New filter:", newFilter);
  //       console.log(paramsWithDelimiter.indexOf(param));
  //       console.log('Current param:', param);
  //       console.log('Splice', paramsWithDelimiter.splice(paramsWithDelimiter.indexOf(param), 1))
  //       console.log('After splice', paramsWithDelimiter)
  //       console.log('Join together:', paramsWithDelimiter.splice(paramsWithDelimiter.indexOf(param), 1).join('&'));
  //       console.log(filter + paramsWithDelimiter.splice(paramsWithDelimiter.indexOf(param), 1).join('&'));
  //     }
  //     else {
  //       console.log('New one added');
  //     };
  //   });
  //   // window.location = url + '&' + currentParams;
  // }
  // else {
  //   console.log('Empty')
  // };
  // $("#brand > option").each(function() {
  //   if (this.value == queryString) {
  //     this.selected = 'selected';
  //   }
  // // });
  // if (currentParams.length > 0) {
  //   console.log('Its not empty');
  //   var currentParams = currentParams.toString().split('&');
  //   console.log(currentParams);
  // }
  // else {
  //   console.log('Its empty')
  // }

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

  // for ( var i = 0; i < paramsWithDelimiter.length; i++ ) {
  //   var newFilter = filter.split('=')[0].split('?')[1];
  //   if ( paramsWithDelimiter[i].indexOf(newFilter) >= 0 ) {
  //     paramsWithDelimiter.splice(paramsWithDelimiter.indexOf(i), 1).join('&');
  //     window.location = filter + '&' + paramsWithDelimiter.join('&')
  //   }
  //   else {
  //     window.location = filter + '&' + currentParams;
  //   };
  // };

  // function addOrUpdateUrlParam(uri, paramKey, paramVal) {
  //   var re = new RegExp("([?&])" + paramKey + "=[^&#]*", "i");
  //   if (re.test(uri)) {
  //     uri = uri.replace(re, '$1' + paramKey + "=" + paramVal);
  //   } else {
  //     var separator = /\?/.test(uri) ? "&" : "?";
  //     uri = uri + separator + paramKey + "=" + paramVal;
  //   }
  //   return uri;
  // };
  // function updateQueryStringParameter(uri, key, value) {
  //   var re = new RegExp("([?|&])" + key + "=.*?(&|#|$)", "i");
  //   if (uri.match(re)) {
  //     return uri.replace(re, '$1' + key + "=" + value + '$2');
  //   } else {
  //     var hash =  '';
  //     if( uri.indexOf('#') !== -1 ){
  //         hash = uri.replace(/.*#/, '#');
  //         uri = uri.replace(/#.*/, '');
  //     }
  //     var separator = uri.indexOf('?') !== -1 ? "&" : "?";    
  //     return uri + separator + key + "=" + value + hash;
  //   }
  // }


  // $('#brand,#color').on('change', function() {
  //   if ($('#brand').val() != '?brand=all' && $('#color').val() != "?color=all") {
  //    window.location = addOrUpdateUrlParam(window.location.href, $('#brand').val(), $('#color').val());
  //   }
  // });


});