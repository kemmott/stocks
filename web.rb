require 'sinatra'
require 'rest-client'
require 'nokogiri'	
require 'json'

get '/' do
	"Hello, Everybody!"
end

get '/stocks/:symbol' do
    resp = RestClient.get("http://www.google.com/ig/api?stock=#{params[:symbol]}")
    doc = Nokogiri::XML(resp)
    stock_price = {
    	:symbol=>"#{doc.css('symbol')[0].attributes['data'].value}",
    	:price=>"#{doc.css('last')[0].attributes['data'].value}"
    }
    JSON.pretty_generate(stock_price)
end
