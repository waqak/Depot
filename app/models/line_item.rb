class LineItem < ActiveRecord::Base
  attr_accessible :cart, :product
  belongs_to :product
  belongs_to :cart

  def total_price
  	product.price * quantity
  end
end
