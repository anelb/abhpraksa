class CartItemsController < ApplicationController

  def create
  	@product = ProductVariant.find(params[:cart_item][:product_variant_id]).product
    @cart_item = CartItem.new(cart_items_params)
    if @cart_item.save
    	flash[:info] = 'Item added to basket'
    	redirect_to category_product_path(@product.categories.first.id, @product.id )
    else
    	#
    end
  end

  private

    def cart_items_params
      params.require(:cart_item).permit(:cart_id, :product_variant_id, :quantity, 
                     product_variant_attributes: [ :size_id, :color_id ])
    end

end
