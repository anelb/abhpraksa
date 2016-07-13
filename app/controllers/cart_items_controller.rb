class CartItemsController < ApplicationController


  def create
    @product = params[:product_details][:product_id]
    @category = params[:product_details][:category_id]

    @product_variant = ProductVariant.find_by(size_id:  params[:product_variant][:size_id], 
                                              color_id: Color.find_color_id(params[:product_variant][:color_id]),
                                              product_id: @product)
    
    @cart_item = current_cart.new_item(product_variant: @product_variant, 
                                       params: cart_items_params)
    #byebug
    if @cart_item.save
      flash[:info] = 'Item added to basket'
    else
      flash[:warning] = @cart_item.errors.full_messages.first
    end
    redirect_to category_product_path(@category, @product)
  end

  def destroy
    cart_item = CartItem.find(params[:cart_item_id])
    product = cart_item.product_variant.product
    CartItem.find(params[:cart_item_id]).destroy
    if current_cart.cart_items.empty?
      flash[:info] = "Your cart is now empty"
      redirect_to category_product_path(product.categories.first.id, product.id )
    else
      flash[:info] = 'Product removed from cart'
      redirect_to cart_path
    end
  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:cart_id, :product_variant_id, :quantity)
  end
end