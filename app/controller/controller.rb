require_relative '../../config/environment'

class Controller < Sinatra::Base

  post '/pirates' do
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
      @post = Post.find_by_id(params[:id].to_i)
      erb :show
    end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id].to_i)
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id].to_i)
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :delete
  end

end
