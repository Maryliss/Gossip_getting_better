class CitiesController < ApplicationController

  def index 
    @cities = City.all
  end


  def show 

    puts "$" * 60
    puts "dans le show de cities et voilà le contenu de params :"
    puts params
    puts "$" * 60
    
    @city = City.find(params[:id])
  end

end
