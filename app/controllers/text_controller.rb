class TextController < ApplicationController
  
  def index
    @texts = Text.all
  end

  def new
    @text = Text.new
  end

  def create
    @text = Text.new(params[:text])
    if @text.save
      redirect_to @text
    else
      render "new"
  end

  def show
    @text = Text.find(params[:id])
  end

end
