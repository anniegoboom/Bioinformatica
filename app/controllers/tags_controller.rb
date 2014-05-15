class TagsController < ApplicationController
  def index
    @tags = Tag.all
    render_json
  end

  private

  def render_json
    render :json => @tags
  end
end
