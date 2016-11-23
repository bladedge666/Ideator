class StaticController < ApplicationController
  def about
  end

  def random
    @idea = Idea.order("RANDOM()").first  
    # @idea = Idea.all.sample
  end
end
