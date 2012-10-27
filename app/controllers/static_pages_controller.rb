class StaticPagesController < ApplicationController
  def home
    @products = Product.paginate(page: params[:page], per_page: 15)
  end
end
