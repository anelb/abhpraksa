jQuery ->
  colors = $('#product_variant_color_id').html()
  console.log(colors)
  $('#product_variant_size_id').change ->
    size = $('#product_variant_size_id :selected').text()
    console.log(size)
    options = $(colors).filter("optgroup[label='#{size}']").html()
    if options
      $('#product_variant_color_id').html(options)
    else
      $('#product_variant_color_id').epmty()
