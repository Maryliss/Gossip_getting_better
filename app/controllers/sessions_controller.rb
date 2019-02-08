class SessionsController < ApplicationController

  def new 
    @user = ""
  end

  def create 
    # cherche s'il existe un utilisateur en base avec l’e-mail
    @user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    # redirige où tu veux, avec un flash ou pas
    flash[:success] = "Vous êtes connecté à votre compte!"
    redirect_to potins_path

    else
    flash.now[:danger] = 'Email ou mot de passe non valide'
    render 'new'
    end

  end

  def show 
    @user = User.find(params[:id])
  end

  def destroy 
    puts "debut def destroy"
    session.delete(:user_id)
    puts "fin def destroy"
    redirect_to potins_path
  end
  
end
