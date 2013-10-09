require 'sinatra'
require 'rest-client'
require 'nokogiri'	
require 'json'

get '/' do
	"Hello, Everybody!"
end

get '/cof' do
    resp = RestClient.get("http://www.google.com/ig/api?stock=COF")
    doc = Nokogiri::XML(resp)
    cof_price = {
    	:symbol=>"COF",
    	:price=>"#{doc.css('last')[0].attributes['data'].value}"
    }
    JSON.pretty_generate(cof_price)
end
