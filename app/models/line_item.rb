class LineItem < ActiveRecord::Base
  attr_accessible :cart, :product
  belongs_to :product
  belongs_to :cart

end
