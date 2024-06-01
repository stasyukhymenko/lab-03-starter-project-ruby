require 'sinatra'
require './calculator'

class CalculatorApp < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/calculate' do
    @a = params[:a].to_i
    @b = params[:b].to_i
    @operation = params[:operation]
    calculator = Calculator.new

    @result = case @operation
              when 'add'
                calculator.add(@a, @b)
              when 'subtract'
                calculator.subtract(@a, @b)
              when 'multiply'
                calculator.multiply(@a, @b)
              when 'divide'
                calculator.divide(@a, @b)
              end

    erb :index
  end

  run! if app_file == $0
end
