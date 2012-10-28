class CartItem < ActiveRecord::Base
	attr_accessible :product_id

	belongs_to :cart
	belongs_to :product
	belongs_to :order
end
