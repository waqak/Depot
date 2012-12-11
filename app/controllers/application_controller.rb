class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def current_cart
  	Cart.find(session[:cart_id])
  rescue
  	cart = Cart.new
  	session[:cart_id] = cart.id
  	cart
  end

end
