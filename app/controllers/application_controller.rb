
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :'articles/new'
  end

  post '/articles' do
    @article = Article.create(title: params[:title],content: params[:content])
    #binding.pry
    redirect ('/articles/' + @article.id.to_s)
    erb :'articles/show'
    binding.pry
  end

  get '/articles' do
    @articles = Article.all
    #binding.pry
    erb :'articles/index'
  end

  get '/articles/:id' do
    @article = Article.find_by(id:params[:id].to_i)
    #binding.pry
    erb :'articles/show'
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id:params[:id].to_i)
    #binding.pry
    erb :'articles/edit'
  end

  patch '/articles/:id' do
    @article = Article.find_by(id:params[:id].to_i)
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect ("/articles/#{@article.id}")
  end

  delete '/articles/:id' do
    Article.find_by(id: params[:id]).destroy
    #binding.pry
    redirect '/articles'
  end

  
  
end
