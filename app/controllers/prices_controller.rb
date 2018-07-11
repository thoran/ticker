class PricesController < ApplicationController

  def show
    @prices = Price.where(pair: show_prices_params)
  end

  def create
    respond_to do |format|
      if Price.transaction{Price.create(create_prices_params)}
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

  # def create_prices_params
  #   params.require(:prices)
  #   prices = JSON.parse(params[:prices])
  #   prices.collect! do |price|
  #     if price.keys.all?{|k| create_permitted_fields.include?(k)}
  #       price
  #     else
  #       nil
  #     end
  #   end
  #   raise ActionController::UnpermittedParameters if prices.any?{|e| e.nil?}
  #   prices
  # end

  def create_prices_params
    params.require(:prices)
    prices = JSON.parse(params[:prices])
    prices.collect! do |price|
      price.slice(*create_permitted_fields)
    end
    prices
  end

  def create_permitted_fields
    @create_permitted_fields ||= %w{pair volume_24h volume transition_time status session prev_close last current_time bid ask}
  end

end
