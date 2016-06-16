jQuery ->
  colors = $('#test').html()
  console.log(colors)
  $('#product_variant_size_id').change ->
    size = $('#product_variant_size_id :selected').text()
    console.log(size)
    options = $(colors).filter("optgroup[label='#{size}']").html()
    if options
      $('#test').html(options)
    else
      $('#test').epmty()
