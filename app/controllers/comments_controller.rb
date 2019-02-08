class CommentsController < ApplicationController
  before_action :authenticate_user

  def create 
  @comment = Comment.new('potin_id'=> params[:potin_id], user_id: current_user.id, 'content' => params[:content])
  
    if @comment.save # essaie de sauvegarder en base le commentaire
      # si ça marche, il redirige vers la page d'index du site
      flash[:success] = "Commentaire créé avec succès!"
      redirect_to potins_path(params[:potin_id])
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      flash[:notice] = "Commentaire non créé!"
      redirect_to potins_path(params[:potin_id])
      flash.delete(:notice)
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi!"
      redirect_to new_session_path
    end
  end

end
