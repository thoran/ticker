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

  def initialize(pair: pair)
    @pair = pair
  end

  def get(pair)
    url = self.class.send(pair.downcase) + '/ticker'
    HTTP.get(url)
  end

end
