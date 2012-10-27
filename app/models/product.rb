class Product < ActiveRecord::Base
	attr_accessible :description, :img_url, :price, :title
	has_many :cart_items

	validates :title, :description, :price, :img_url, presence: true

	default_scope order: "title DESC"

	private
	def check_for_references
		if line_items.empty?
		return true
		else
			flash[:error] = "Cannot destroy products that are in carts"
			redirect_to product_path
		end
	end
end
