class Product < ActiveRecord::Base
  attr_accessible :description, :img_url, :price, :title
end
