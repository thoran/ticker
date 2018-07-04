class PricesController

  def index
    
  end

  def prices_params
    params.require(:pair)
  end

end
