class InfoSnippetsController < ApplicationController
  def new
  end

  def create
    render plain: params[:information].inspect
  end
end
