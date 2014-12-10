class RelationshipsController < ApplicationController
  def create
    @relationship = current_user.relationship.build(:family_id => params[:family_id])
    if @relationship.save
      flash[:notice] = "Added family member."
      redirect_to root_path
    else
      flash[:error] = "Unable to add family member."
      redirect_to root_path
    end
  end

  def destroy
    @relationship = current_user.relationships.find(params[:id])
    @relationship.destroy
    flash[:notice] = "Removed relationship."
    redirect_to current_user
  end
end
