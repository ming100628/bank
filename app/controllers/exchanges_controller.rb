class ExchangesController < ApplicationController
  def show
    generate_exchange_rates
  end

  def generate_exchange_rates
    @currencies = [:usd, :hkd, :jpy, :gbp]
    @exchange_rates = {}
    @currencies.each do |from|
      @currencies.each do |to|
        next if from == to

        @exchange_rates[from] ||= {}
        @exchange_rates[from][to] = ExchangeService.exchange_rate(from, to, 1)
      end
    end
  end
end
