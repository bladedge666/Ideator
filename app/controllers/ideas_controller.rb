class IdeasController < ApplicationController
  def index
    @ideas = Idea.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  end

  def create
    # @idea = Idea.create(description: params[:idea][:description], author: params[:idea][:description])
    # @idea = Idea.create(params[:idea])
    @idea = Idea.create(idea_params)
    if @idea.valid?
      flash[:success] = "Hoorah! You created a new Idea..."
    else
      flash[:alert] = "Failed!!! Something is wrong with your input data"
    end
    redirect_to root_path
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      flash[:success] = "Successfully updated the Idea..."
      redirect_to root_path
    else
      flash[:alert] = "Failed to update the Idea..."
      redirect_to edit_idea_path(params[:id])
    end
  end 

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:notice] = "Successfully deleted the Idea..."
    redirect_to root_path
  end

  private

  def idea_params
    params.require(:idea).permit(:description, :author)
  end

end
