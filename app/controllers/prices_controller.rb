class PricesController < ApplicationController

  def show
    @prices = Price.where(pair: show_prices_params).limit(10)
  end

  def create
    @prices = JSON.parse(create_prices_params)
    respond_to do |format|
      if Price.transaction{Price.create(@prices)}
        format.html{redirect_to :root, notice: 'Prices successfully inserted.' }
        format.json{render :show, status: :created, location: @prices}
      else
        format.html{render :new}
        format.json{render json: @prices.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def show_prices_params
    params.require(:id)
  end

  def create_prices_params
    params.require(:prices)
  end

  # def permitted_fields
  #   %i{pair volume_24 volume transition_time status session prev_close last current_time bid ask}
  # end

end
