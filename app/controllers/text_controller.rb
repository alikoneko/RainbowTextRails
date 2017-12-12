class TextController < ApplicationController
  
  def index
    @texts = Text.all
  end

  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)
    if @text.save
      redirect_to @text
    else
      render "new"
    end
  end

  def show
    @text = Text.find(params[:id])
  end

  def show_aesthetic
    @text = Text.find(params[:id])
  end

  private
  def text_params
    allow = [:text]
    params.require(:text).permit(allow)
  end
end
