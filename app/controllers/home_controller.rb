class HomeController < ApplicationController
  def index
  	@front_products = Product.where to_front: true
  end
end
