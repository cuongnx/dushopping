class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		remember = params[:session][:remember]
		if user && user.authenticate(params[:session][:password])
			if remember == '1'
				sign_in user, true
			else
				sign_in user, false
			end
			redirect_back_or root_path
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_back_or root_path
	end
end
