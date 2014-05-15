class InfoSnippetsController < ApplicationController

  respond_to :json

  def index
    info = params["tag_id"].present? ? Tag.find_by_id(params["tag_id"]).info_snippets.by_update_date : InfoSnippet.by_update_date
    @info_hash = info.map do |i|
      {
        id: i.id,
        text: i.text,
        created_at: i.created_at,
        updated_at: i.updated_at
      }
    end
    render_json
  end

  def show
    snippet = InfoSnippet.find_by_id(params[:id])
    tags = snippet.tags.map do |tag|
      {
        id: tag.id,
        name: tag.name,
        type: tag.tag_type.name,
        type_id: tag.tag_type.id,
      }
    end
    @info_hash =
      {
        id: snippet.id,
        text: snippet.text,
        tags: tags,
        created_at: snippet.created_at,
        updated_at: snippet.updated_at
      }
    render_json
  end

  private

  def render_json
    render :json => @info_hash
  end

  #for create and update
  def info_params
    params.require(:info_snippet).permit(:text)
  end

end
