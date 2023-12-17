class ExchangeService
  def self.exchange_rate(from, to, amount)
    require 'uri'
    require 'net/http'

    url = URI("https://currency-exchange.p.rapidapi.com/exchange?from=#{from}&to=#{to}&q=#{amount}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] =  Rails.application.credentials[:x_rapidapi_key]
    request["X-RapidAPI-Host"] = 'currency-exchange.p.rapidapi.com'

    response = http.request(request)
    response.read_body.to_f.round(3)
  end
end
