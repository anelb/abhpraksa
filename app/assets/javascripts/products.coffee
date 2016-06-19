jQuery ->

  colors = $('#product_variant_color_id').html()
  size = $('#product_variant_size_id :selected').text()
  options = $(colors).filter("optgroup[label='#{size}']").html()
  $('#product_variant_color_id').html(options)

  $('#product_variant_size_id').change ->
    size = $('#product_variant_size_id :selected').text()
    options = $(colors).filter("optgroup[label='#{size}']").html()
    $('#product_variant_color_id').html(options)
  
