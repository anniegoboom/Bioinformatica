class InfoSnippetsController < ApplicationController

  respond_to :json

  def index
    info = InfoSnippet.all
    render :json => info
  end

end
