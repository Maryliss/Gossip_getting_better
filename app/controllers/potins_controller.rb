class PotinsController < ApplicationController

  def index
    @potins = Potin.all
  end

  def new
    # Méthode qui crée un potin vide et l'envoie une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @potin = Potin.new
    puts "*" * 60
    puts "on est dans le nouveau potin"
    puts params
    puts "*" * 60
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    puts "$" * 60
    puts "dans le Create voilà le contenu de params :"
    puts params
    puts "$" * 60
    @potin = Potin.new('title' => params[:title],'content' => params[:content], 'user_id'=> rand(User.first.id..User.last.id))
    @potin.user = User.find_by(id: session[:user_id])

    if @potin.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      flash[:success] = "Potin créé avec succès!"
      redirect_to potins_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      flash[:notice] = "Potin non créé!"
      redirect_to potins_path(params[:potin_id])
      flash.delete(:notice)
    end

  end

  def show
    @potin = Potin.find(params[:id])
  end

  def edit 
    @potin = Potin.find(params[:id])
  end

  def update 
    @potin = Potin.find(params[:id])

    if @potin.update("title" => params[:title], "content" =>  params[:content])
      redirect_to @potin
    else
      render :edit
    end
  end

  def destroy 
    @potin = Potin.find(params[:id])
    @potin.destroy
    redirect_to potins_path
  end

end
