class PetsController < ApplicationController

  get '/pets' do
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
    @pet = Pet.create(name: params["pet"]["name"])
    @owner = Owner.find_by(name: params["owner"]["name"])
    if @owner
      @pet.owner_id = @owner.id
      @owner.pets << @pet
    else
      @new_owner = Owner.create(name: params["owner"]["name"])
      @pet.owner_id = @new_owner.id
      @new_owner.pets << @pet
    end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do 
    @pet = Pet.find(params[:id])
    @owner = Owner.find(@pet.owner_id)
    erb :'/pets/edit'
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 
    
    redirect to "pets/#{@pet.id}"
  end
end