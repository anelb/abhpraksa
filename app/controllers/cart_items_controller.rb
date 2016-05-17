class CartItemsController < ApplicationController

  def create
    
  end

  private

    def cart_items_params
      params.require(:cart_item).permit(:cart_id, :product_variant_id, :quantity, 
                     product_variant_attributes: [:size_id])
    end

end
