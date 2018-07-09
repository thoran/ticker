class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  PAIRS = %w{BTCAUD ETHAUD}

  def index
    @prices = PAIRS.collect do |pair|
      TickerService.new.get(pair).merge('pair' => pair)
    end
  end

  def create
    @price = Price.new
  end

end
