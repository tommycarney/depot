class StoreController < ApplicationController
  before_action :increment_visits, only: [:index]
  skip_before_action :authorize


  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      @visits = visits
    end
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
