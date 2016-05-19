class CartItemsController < ApplicationController

  before_action :set_product_variant
  before_action :set_product

  def create
    @cart_item = @product_variant.cart_items.build(cart_items_params)

    if @cart_item.save
      flash[:info] = 'Item added to basket'
    else
      flash[:danger] = @cart_item.errors.full_messages.first
    end
    redirect_to category_product_path(@product.categories.first.id, @product.id )
  end

  private

    def cart_items_params
      params.require(:cart_item).permit(:cart_id, :product_variant_id, :quantity)
    end

    def set_product_variant
      @product_variant = ProductVariant.find_by(size_id:  params[:product_variant][:size_id], 
                                              color_id: params[:product_variant][:color_id])
    end

    def set_product
      @product = @product_variant.product
    end
end