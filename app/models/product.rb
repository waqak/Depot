class Product < ActiveRecord::Base
  default_scope :order => 'title'
  attr_accessible :title, :description, :img_url, :price
  validates :title, :description, :img_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :img_url, :format => {
   :with => %r{\.(gif|jpg|png)$}i,
   :message => 'must be a URL for GIF, JPG or PNG image.'
  }

  has_many :line_items

  before_destroy :ensure_no_line_items_present

  def ensure_no_line_items_present 
  	if line_items.count.zero?
  		return true
  	else
  		error[:base] << "line items associated with this product are still not deleted"
  		return false
  	end
  end
end
