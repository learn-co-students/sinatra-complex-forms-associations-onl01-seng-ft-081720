class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners= Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 

    @pet= Pet.create(name: params[:pet][:name])

    if params[:pet][:name] != "" && params[:owner][:name] == "" && params[:pet][:owner_id]
      @owner= Owner.find(params[:pet][:owner_id])
      @owner.pets << @pet

    elsif params[:pet][:name] != "" && params[:owner][:name] != ""
      @owner= Owner.create(name: params[:owner][:name])
      @owner.pets << @pet

    end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @pet=Pet.find(params[:id])
    @owners= Owner.all
    erb :'/pets/edit'
  end

  patch '/pets/:id' do 
    # binding.pry
    @pet= Pet.find(params[:id])
    if params[:owner][:name] == ""
        @pet.update(params[:pet])
    else
      @owner= Owner.create(params[:owner])
      @pet.update(name:params[:pet][:name],owner_id:@owner.id)
    end
    redirect to "pets/#{@pet.id}"
  end

end