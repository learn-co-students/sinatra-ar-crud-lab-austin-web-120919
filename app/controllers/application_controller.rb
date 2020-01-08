
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    # binding.pry
    @article = Article.find(params[:id].to_i)
    erb :show
  end

  get '/articles/:id/edit' do
    #binding.pry
    @article = Article.find(params[:id].to_i)
    #binding.pry
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    @article.update(params.except(:_method))
    redirect to "/articles/#{ @article.id }"
  end

  delete '/articles/:id' do
    Article.find(params[:id].to_i).delete
    redirect to "/articles"
  end

end
