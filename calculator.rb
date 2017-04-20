require 'sinatra'
require 'bigdecimal'
require 'bigdecimal/util'

set :views, "views"

get '/' do
    erb :index
end

post '/' do
    bill = params[:bill].to_d
    num_people = params[:num_people].to_d

    tip = bill * 0.2
    total_bill = bill + tip

    ind_pay = total_bill/num_people

    erb :results, :locals => {'total_bill' => sprintf('%.2f',total_bill), 'tip' => sprintf('%.2f',tip), 'ind_pay' => sprintf('%.2f', ind_pay)}
end
