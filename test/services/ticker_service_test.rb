# ticker/test/services/ticker_service_test.rb

require 'test_helper'

class TickerServiceTest < ActiveSupport::TestCase
  describe TickerService do

    WebMock.disable_net_connect!(allow_localhost: true)

    let(:pair){'BTCAUD'}

    let(:ticker_response) do
      ticker_response_filename = File.expand_path('../../fixtures/ticker_response.json', __FILE__)
      File.read(ticker_response_filename)
    end

    before do
      stub_request(:get, "https://data.exchange.coinjar.com/products/#{pair}/ticker").
        with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
          to_return(status: 200, body: ticker_response)
    end

    it "calls HTTP.get" do
      TickerService.new.get(pair)
    end

  end
end
