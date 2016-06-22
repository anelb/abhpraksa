module Admin::ProductsHelper

  def product_variant_quantity(f)
    if current_page? action: 'new'
      1
    else
      if f.object.quantity.blank?
        1
      else
        f.object.quantity
      end
    end  
  end
end
