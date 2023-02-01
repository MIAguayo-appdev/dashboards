class CurrenciesController < ApplicationController

def first_currency

  #require "open-uri" --> would do this if we weren't using rails

  @raw_data = open("https://api.exchangerate.host/symbols").read #to get the api, this returns a string with the contents of the link
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")


  @array_of_symbols = @symbols_hash.keys
  render({ :template => "currency_templates/step_one.html.erb"})
end
 
def second_currency
  @raw_data = open("https://api.exchangerate.host/symbols").read #to get the api, this returns a string with the contents of the link
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")

  @array_of_symbols = @symbols_hash.keys

  @first_currency = params.fetch("from_currency")

render({ :template => "currency_templates/step_two.html.erb"})

end

def conversion

  @raw_data = open("https://api.exchangerate.host/symbols").read #to get the api, this returns a string with the contents of the link
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")


  @array_of_symbols = @symbols_hash.keys

  @first_currency = params.fetch("from_currency")
  @second_currency = params.fetch("to_currency")


render({ :template => "currency_templates/step_three.html.erb"})
end

end
