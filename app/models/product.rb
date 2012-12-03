class Product < ActiveRecord::Base
  attr_accessible :title, :description, :img_url, :price
  validates :title, :description, :img_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :img_url, :format => {
   :with => %r{\.(gif|jpg|png)$}i,
   :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end
