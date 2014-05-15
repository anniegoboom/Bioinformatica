class InfoSnippetsController < ApplicationController

  respond_to :json

  def index
    @info = InfoSnippet.all
    render_json
  end

  def show
    @info = InfoSnippet.find(params[:id])
    render_json
  end

  private

  def render_json
    render :json => @info
  end

  #for create and update
  def info_params
    params.require(:info_snippet).permit(:text)
  end

end
