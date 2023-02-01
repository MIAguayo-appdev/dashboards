class CurrenciesController < ApplicationController

def first_currency

  #require "open-uri" --> would do this if we weren't using rails

  @raw_data = open("https://api.exchangerate.host/symbols").read #to get the api, this returns a string with the contents of the link
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")


  @array_of_symbols = @symbols_hash.keys
  render({ :template => "currency_templates/step_one.html.erb"})
end
  
end
