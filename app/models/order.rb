class Order < ActiveRecord::Base
	PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
	attr_accessible :address, :name, :pay_type

	belongs_to :user
	has_many :cart_items, dependent: :destroy

	validates :name, presence: true, length: { maximum: 50 }
	validates :address, :pay_type, presence: true

	def add_items_from_cart(cart)
		cart.cart_items.each do |item|
			item.cart_id = nil			
			cart_items << item
			item.save
		end
	end
end
