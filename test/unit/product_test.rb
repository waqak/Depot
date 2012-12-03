require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  fixtures :products

  # test "the truth" do
  #   assert true
  # end

  # test that product attributes must not be empty
  test "product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:img_url.any?  	
  	assert product.errors[:price].any?
  end

  #test that product title must be unique
  test "product title must be unique" do 
  	product = Product.new (:title => products(:ruby).title,
							:description => "yyy",
							:img_url => "zzz.jpg")

  	assert !product.save
  	assert_equal I18n.translate('activerecord.errors.messages.taken')
  		product.errors[:title].join('; ')
  end

  #test that product price must have a positive value greater than 0.01
  test "product price must have a positive value" do
  	product = Product.new (:title => "My Book Title",
							:description => "yyy",
							:img_url => "zzz.jpg")
  	
  	product.price = -1
  	assert product.invalid?
  	assert_equal "Product price must be equal to or greater than 0.01"
  		product.errors[:price].join('; ')

  	product.price = 0
  	assert product.invalid?
  	assert_equal "Product price must be equal to or greater than 0.01"
  		product.errors[:price].join('; ')

  	product.price = 1
  	assert product.valid?
  end

  #method to be used in img_url validation test
  def new_product(image_url)
	Product.new(:title => "My Book Title",
				:description => "yyy"
				:price => 1
				:img_url => image_url
  end

  #test that product's img_url must be a .png, .gif or .jpg file
  test "product's img_url must end with a .png, .gif or .jpg" do
  	ok = %w{fred.jpg fred.png fred.gif FRED.jpg FRED.gif FRED.png http://a.b.c/d/e/f/./jpg/png/gif}
  	bad = %w{ fred.doc fred.gif/more fred.gif.more }
	
	ok.each do |name|
		assert new_product(name).valid?, "#{name} shouldn't be invalid"
	end
	
	bad.each do |name|
		assert new_product(name).invalid?, "#{name} shouldn't be valid"
	end
  end

end
