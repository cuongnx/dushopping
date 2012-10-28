class CartsController < ApplicationController
	before_filter :check_cart_id
	def show
		if @cart.cart_items.empty?
			redirect_to root_path, notice: "Your cart is currently empty"
		else
			respond_to do |format|
				format.html # show.html.erb
				format.xml { render :xml => @cart}
			end
		end
	end

	def destroy
		if !@cart.user
			session[:cart_id] = nil
		end
		@cart.destroy

		redirect_to root_path, notice: "Your cart is now empty"
	end

	private

	def check_cart_id
		@cart = current_cart
		if params[:id].to_i != @cart.id
			redirect_to root_path, notice: "Invalid cart!"
		end
	end
end
