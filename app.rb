require 'bundler'
Bundler.require
require_relative './lib/SpaceCats'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/rabbits.db")

  get '/spacecat' do
    @spacecat = SpaceCat.all 
    haml :index
  end


  get '/spacecats/new' do
    @spacecat = SpaceCat.new
    haml :new
  end

 
  post '/spacecat' do
    @spacecat = SpaceCat.new(params[:spacecat])
    if @spacat.save
      status 201 
      redirect '/spacecats/' + @spacecat.id.to_s
    else
      status 400 
      haml :new
    end
  end

  get '/spacecat/edit/:id' do
    @rabbit = SpaceCat.get(params[:id])
    haml :edit
  end

  put '/spacecats/:id' do
    @rabbit = SpaceCat.get(params[:id])
    if @spacecat.update(params[:spacecat])
      status 201  
      redirect '/spacecats/' + params[:id]
    else
      status 400 
      haml :edit
    end
  end


  get '/spacecats/delete/:id' do
    @spacecat = SpaceCat.get(params[:id])
    haml :delete
  end


  delete '/spacecat/:id' do
    SpaceCat.get(params[:id]).destroy
    redirect '/spacecats'
  end


  get '/spacecat/:id' do
    @rabbit = SpaceCat.get(params[:id])
    haml :show
  end

  DataMapper.auto_upgrade!