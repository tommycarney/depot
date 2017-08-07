class StoreController < ApplicationController
  before_action :increment_visits, only: [:index]

  def index
    @products = Product.order(:title)
    @visits = visits
  end

  private

  def increment_visits
    session[:visits] ||= 1
    session[:visits] += 1
  end

  def visits
    session[:visits]
  end
end
