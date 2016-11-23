class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def create
    # @idea = Idea.create(description: params[:idea][:description], author: params[:idea][:description])
    # @idea = Idea.create(params[:idea])
    @idea = Idea.create(idea_params)
    redirect_to root_path
  end

  def new

  end

  private

  def idea_params
    params.require(:idea).permit(:description, :author)
  end

end
