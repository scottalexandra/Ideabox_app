class IdeasController < ApplicationController

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(title: params[:idea][:title],
                     description: params[:idea][:description],
                     user_id: current_user.id)
    if @idea.save
      redirect_to user_path(@idea.user)
      flash[:notice] = "New Idea Successfully Added"
    else
      render :new
      flash[:error] = "An error occurred, please resubmit idea"
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy!
    redirect_to user_path(@idea.user)
    flash[:notice] = "Idea Successfully Deleted"
  end


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
