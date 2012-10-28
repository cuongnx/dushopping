class StaticPagesController < ApplicationController
	def home
		@products = Product.paginate(page: params[:page], per_page: 15)
	end

	def search
		para = params[:static_pages]
		if para
			query = para[:query]
			orderby = params[:static_pages][:orderby]
			title = para[:title]
			desc = para[:description]
			if desc == '0'
				title_phrase = "%#{query}%"
				desc_phrase = ""
			else
				if title == '0'
					title_phrase = ""
					desc_phrase = "%#{query}%"
				else
					title_phrase = "%#{query}%"
					desc_phrase =  "%#{query}%"
				end
			end
			@products = Product.where("title LIKE :title OR description LIKE :desc", title: title_phrase, desc: desc_phrase)
				.order("title "+ orderby).paginate(page: params[:page], per_page: 15)
		else
			@products = Product.paginate(page: params[:page], per_page: 15)
		end
	end
end
