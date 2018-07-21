class TickerService

  class << self

    def base_url
      'https://data.exchange.coinjar.com/products'
    end

    def btcaud
      base_url + '/BTCAUD'
    end

    def ethaud
      base_url + '/ETHAUD'
    end

  end # class << self

  def initialize(pair = nil)
    @pair = pair
  end

  def get_raw(pair = nil)
    pair = pair || @pair
    url = self.class.send(pair.downcase) + '/ticker'
    HTTP.get(url).body
  end

  def get(pair = nil)
    pair = pair || @pair
    JSON.parse(get_raw(pair)).merge('pair' => pair)
  end

end
