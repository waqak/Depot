class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def current_cart
  	Cart.find(session[:cart_id])
  	puts "fetching cart from session"
  rescue
  	cart = Cart.new
  	session[:cart_id] = cart.id
  	puts "making new cart"
  	cart
  end

end
