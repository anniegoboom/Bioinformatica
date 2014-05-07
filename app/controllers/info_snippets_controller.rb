class InfoSnippetsController < ApplicationController

  def initialize
    @info = InfoSnippet.new
  end

  def new
  end

  def create
    @info = InfoSnippet.new(info_params)

    @info.save
    redirect_to @info
  end

  def show
    @info = InfoSnippet.find(params[:id])
  end

  private

  def info_params
    params.require(:info_snippet).permit(:text)
  end
end
