# create your PigeonsController here
# it should inherit from ApplicationController


class PigeonsController < ApplicationController
  get '/pigeons' do
    @pigeons = Pigeon.all
    erb :'pigeons/index'
  end

  get '/pigeons/new' do
    erb :'pigeons/new'
  end

  get '/pigeons/:id' do
    @pigeon = Pigeon.find_by(id: params[:id])
    erb :'pigeons/show'
  end

  get '/pigeons/:id/edit' do
    @pigeon = Pigeon.find_by(id: params[:id])
    erb :'pigeons/edit'
  end

  post '/pigeons' do
    Pigeon.create(name: params[:name], color: params[:color], gender: params[:gender], lives: params[:lives])
    redirect to('/pigeons')
  end

  delete '/pigeons/:id' do
    Pigeon.destroy(params[:id])
    redirect to('/pigeons')
  end

  patch '/pigeons/:id' do
    @pigeon = Pigeon.find_by(params[:id])
    @pigeon.update(name: params[:name], color: params[:color], gender: params[:gender], lives: params[:lives])
    url = "/pigeons/#{params[:id]}"
    redirect to(url)
  end

end