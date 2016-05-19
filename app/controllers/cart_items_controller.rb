class CartItemsController < ApplicationController


  def create
    @product_variant = ProductVariant.find_by(size_id:  params[:product_variant][:size_id], 
                                              color_id: params[:product_variant][:color_id])
    @product = @product_variant.product

    @cart_item = @product_variant.cart_items.build(cart_items_params)

    if @cart_item.save
      flash[:info] = 'Item added to basket'
    else
      flash[:danger] = @cart_item.errors.full_messages.first
    end
    redirect_to category_product_path(@product.categories.first.id, @product.id )
  end

  def destroy
    cart_item = CartItem.find(params[:cart_item_id])
    product = cart_item.product_variant.product
    CartItem.find(params[:cart_item_id]).destroy
    flash[:info] = 'Product removed from cart'
    redirect_to category_product_path(product.categories.first.id, product.id )
  end

  private

    def cart_items_params
      params.require(:cart_item).permit(:cart_id, :product_variant_id, :quantity)
    end
end