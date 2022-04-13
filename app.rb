require 'rubygems'
require 'sinatra'
require "sinatra/reloader"

get '/' do
  erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"https://rubyschool.us/\">Ruby School</a>"
end

get '/about' do
  erb :about
end

get '/visit' do
  erb :visit
end

post '/visit' do
        @user_name = params[:user_name] # получить, то что отправил браузер
        @user_phone = params[:user_phone] # получить, то что отправил браузер
        @date_time = params[:date_time] # получить, то что отправил браузер
        @master = params[:master] # получить, то что отправил браузер

        @title = 'Спасибо!'
        @message = "#{@user_name}, мы Вас ждем #{@date_time}. Ваш мастер #{@master}!"

        output = File.open('./public/visits.txt', 'a')
        output.write "User: #{@user_name}, Phone: #{@user_phone}, Date and time: #{@date_time}, master: #{@master}\n"
        output.close

        erb :message
end

get '/contacts' do
  erb :contacts
end

post '/contacts' do
        @user_email = params[:user_email] # получить, то что отправил браузер
        @user_message = params[:user_message] # получить, то что отправил браузер

        @title = 'Контакты успешно отправленны!'

        output = File.open('./public/contacts.txt', 'a')
        output.write "User: #{@user_email}, message: #{@user_message}\n"
        output.close

        erb :message
end
