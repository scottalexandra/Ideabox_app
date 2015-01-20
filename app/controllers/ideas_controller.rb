class IdeasController < ApplicationController

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update!(idea_params)
    redirect_to user_path(@idea.user)
  end

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
