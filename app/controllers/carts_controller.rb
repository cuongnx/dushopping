class CartsController < ApplicationController
	before_filter :check_cart_id
	def show
		begin
			@cart = Cart.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			logger.error "Attempt to access invalid cart #{params[:id]}"
			redirect_to root_path, :notice => 'Invalid cart'
		else
			if @cart.cart_items.empty?
				redirect_to root_path, notice: "Your cart is currently empty"
			else
				respond_to do |format|
					format.html # show.html.erb
					format.xml { render :xml => @cart}
				end
			end
		end
	end

	def destroy
		@cart = current_cart
		@cart.destroy
		session[:cart_id] = nil

		redirect_to root_path, notice: "Your cart is now empty"
	end

	private

	def check_cart_id
		if params[:id].to_i != session[:cart_id]
			redirect_to root_path, notice: "Invalid cart!"
		end
	end
end
