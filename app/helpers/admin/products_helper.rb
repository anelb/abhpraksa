module Admin::ProductsHelper

  def product_variant_quantity(f)
    if current_page? action: 'new'
      1
    else
      f.object.quantity
    end  

  end

  # def show_product_categories(category_title)
  #   return if @product.categories.map { |x| x.title }.include? category_title
  # end
end
