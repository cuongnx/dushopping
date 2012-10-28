class OrdersController < ApplicationController
	before_filter :signed_in_user, :correct_cart
	def new
		@order = Order.new
	end

	def create
		@order = Order.new(params[:order])
		@order.user = @user
		@order.add_items_from_cart(@cart)

		if @order.save
			@user.cart(true).destroy
			flash[:success] = "Thank you for shopping!"
			redirect_to root_path
		else
			render 'new'
		end
	end

	private

	def correct_cart
		@user = current_user
		@cart = current_cart

		if !current_user?(@cart.user)
			redirect_to root_path, error: "Invalid cart"
		end
	end
end
