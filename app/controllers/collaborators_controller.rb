class CollaboratorsController < ApplicationController
  def new
    @collaborator = Collaborator.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:user_id])
    @collaborator = Collaborator.new(wiki_id: params[:wiki_id], user_id: params[:user_id])
    
    if @collaborator.save
      flash[:notice] = "User was added as a collaborator."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:alert] = "There was an error adding this collaborator. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
    
    if @collaborator.destroy
      flash[:notice] = "The user was removed as a collaborator."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:alert] = "There was an error removing this collaborator. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end
end
