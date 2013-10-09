require 'sinatra'
require 'json'

get '/' do
	"Hello, Everybody!"
end

get '/cof' do
    resp = RestClient.get("http://www.google.com/ig/api?stock=COF&stock=AAPL&stock=GOOG")
    doc = Nokogiri::XML(resp)
    price = "#{doc.css('last')[1].attributes['data'].value}"
    cof_price = {:cof=>price}
    JSON.pretty_generate(cof_price)
end
