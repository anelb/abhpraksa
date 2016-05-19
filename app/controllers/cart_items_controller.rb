class CartItemsController < ApplicationController

  before_action :set_product_variant
  before_action :set_product
  before_action :check_product_variant_quantity

  def create
    @cart_item = @product_variant.cart_items.build(cart_items_params)
    @cart_item.save
    flash[:info] = 'Item added to basket'
    redirect_to category_product_path(@product.categories.first.id, @product.id )
  end

  private

    def cart_items_params
      params.require(:cart_item).permit(:cart_id, :product_variant_id, :quantity)
    end

    def check_product_variant_quantity
      quantity = ProductVariant.check_quantity(@product_variant).count
      if params[:cart_item][:quantity].blank?
        flash[:danger] = "Quantity missing"
        redirect_to category_product_path(@product.categories.first.id, @product.id )
      elsif params[:cart_item][:quantity].to_i > quantity
        flash[:danger] = "Please enter a quantity less then #{quantity}"
        redirect_to category_product_path(@product.categories.first.id, @product.id ) 
      end 
    end

    def set_product_variant
      @product_variant = ProductVariant.find_by(size_id:  params[:product_variant][:size_id], 
                                              color_id: params[:product_variant][:color_id])
    end

    def set_product
      @product = @product_variant.product
    end
end