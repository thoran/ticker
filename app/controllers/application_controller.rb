class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  PAIRS = %w{BTCAUD ETHAUD}

  def index
    @pair_prices = {}
    PAIRS.each do |pair|

    end
  end

end
