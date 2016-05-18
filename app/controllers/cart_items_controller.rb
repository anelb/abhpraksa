class CartItemsController < ApplicationController

  def create
    @product_variant = ProductVariant.find_by(size_id:  params[:product_variant][:size_id], 
                                              color_id: params[:product_variant][:color_id])
  	@product = @product_variant.product
    @cart_item = @product_variant.cart_items.build(cart_items_params)
    if @cart_item.save
    	flash[:info] = 'Item added to basket'
    	redirect_to category_product_path(@product.categories.first.id, @product.id )
    else
      flash[:danger] = 'Quantity missing'
    	render 'products/show'
    end
  end

  private

    def cart_items_params
      params.require(:cart_item).permit(:cart_id, :product_variant_id, :quantity)
    end

end

# class CartItemsController < ApplicationController

#   def create
#     @product_variant = ProductVariant.find(params[:cart_item][:product_variant_id])
#     @product = @product_variant.product
#     @cart_item = CartItem.new(cart_items_params)
#     if @cart_item.save
#       flash[:info] = 'Item added to basket'
#       redirect_to category_product_path(@product.categories.first.id, @product.id )
#     else
#       flash[:danger] = 'Quantity missing'
#       render 'products/show'
#     end
#   end

#   private

#     def cart_items_params
#       params.require(:cart_item).permit(:cart_id, :product_variant_id, :quantity, 
#                      product_variant_attributes: [ :size_id, :color_id, :id ])
#     end

# end