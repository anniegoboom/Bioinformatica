class InfoSnippetsController < ApplicationController
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
    binding.pry
    params.require(:info_snippet).permit(:text)
  end
end
