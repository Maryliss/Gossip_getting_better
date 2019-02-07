class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new
    puts "*" * 60
    puts "on est dans le nouveau user"
    puts params
    puts "*" * 60

  end

  def create 
    @user = User.new('first_name' => params[:first_name],'last_name' => params[:last_name],'email' => params[:email], 'age'=> params[:age],'city_id'=> params[:city_id], 'description'=> params[:description], 'password'=> params[:password])
    puts "$" * 60
    puts "dans le Create voilà le contenu de params :"
    puts params
    puts "$" * 60

    if @user.save # essaie de sauvegarder en base @user
      # si ça marche, il redirige vers la page d'accueil du site
      flash[:success] = "Votre compte a bien été créé!"
      redirect_to potins_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      flash[:notice] = "Compte non créé!"
      render 'new'
    end

  end
  
  
end
