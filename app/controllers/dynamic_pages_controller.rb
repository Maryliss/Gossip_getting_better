class DynamicPagesController < ApplicationController
  def potin
    @id_potin = params[:id]
  end

  def user
    @id_user = params[:id]
  end
end
