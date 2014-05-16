class TagsController < ApplicationController

  respond_to :json

  def index
    tags = params["info_snippet_id"].present? ? InfoSnippet.find_by_id(params["info_snippet_id"]).tags : Tag.all
    @tag_hash = {}

    TagType.all.each do |type|
      type_array = []
      @tag_hash[type.name] = type.tags & tags
      @tag_hash[type.name].collect! do |tag|
        {
          id: tag.id,
          name: tag.name,
          type: tag.tag_type.name,
          type_id: tag.tag_type.id
        }
      end
    end

    render_json
  end

  def show
    tag = Tag.find_by_id(params[:id])

    info_snippets = tag.info_snippets.map do |snippet|
      {
        id: snippet.id,
        text: snippet.text,
        created_at: snippet.created_at,
        updated_at: snippet.updated_at
      }
    end
    @tag_hash =
      [{
        id: tag.id,
        name: tag.name,
        type: tag.tag_type.name,
        type_id: tag.tag_type.id,
        info_snippets: info_snippets
      }]
    render_json
  end

  private

  def render_json
    render :json => @tag_hash
  end
end
