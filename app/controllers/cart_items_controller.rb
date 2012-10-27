class CartItemsController < ApplicationController
	def create
		@cart = current_cart
		prod_id = params[:cart_item][:product_id]
		current_item = @cart.cart_items.find_by_product_id(prod_id)

		if current_item
		current_item.quantity += 1
		current_item.save
		else
			@cart.cart_items.create(product_id: prod_id)
		end

		flash[:success] = "Item successfully added to your cart"
		redirect_to @cart
	end

	def destroy
		CartItem.find(params[:id]).destroy
		if current_cart.cart_items.empty?
			redirect_to root_path, notice: "Your cart is currently empty"
		else
			redirect_to current_cart
		end
	end
end
