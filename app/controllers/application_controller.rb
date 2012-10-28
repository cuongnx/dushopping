class ApplicationController < ActionController::Base
	protect_from_forgery
	include SessionsHelper

	private
	def current_cart
		if signed_in?
			current_user.cart ||= Cart.create
		else
			Cart.find(session[:cart_id])
		end
	rescue
		cart = Cart.create()
		session[:cart_id] = cart.id
		cart
	end

	def admin_user
		unless current_user && current_user.admin?
			redirect_to(root_path, notice: "Permission denied")
		end
	end
end
