class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.new(
      "object" => Faker::Lorem.sentence(word_count: 3),
      "body" => Faker::ChuckNorris.fact
    )
    @email.save

    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
  end

  def show
    @email = Email.find(params[:id])
    
    #respond_to do |format|
    #  format.html { redirect_to root_path }
    #  format.js { }
    #end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    flash[:danger] = "L'email n°#{@email.id} a bien été supprimé !"
    redirect_to root_path
  end
  
end
