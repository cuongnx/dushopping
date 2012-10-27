class Product < ActiveRecord::Base
  attr_accessible :description, :img_url, :price, :title
  
  validates :title, :description, :price, :img_url, presence: true
  
  default_scope order: "title DESC"
end
