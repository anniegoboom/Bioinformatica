class TagsController < ApplicationController

  respond_to :json

  def index
    tags =  if params["info_snippet_id"].present?
              InfoSnippet.find_by_id(params["info_snippet_id"]).tags
            elsif params["program_id"].present?
              Program.find_by_id(params["program_id"]).tags
            else
              Tag.all
            end
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

    companies = tag.companies.map do |company|
      {
        id: company.id,
        ticker: company.ticker
      }
    end

    @tag_hash =
      [{
        id: tag.id,
        name: tag.name,
        type: tag.tag_type.name,
        type_id: tag.tag_type.id,
        companies: companies.uniq
      }]
    render_json
  end

  private

  def render_json
    render :json => @tag_hash
  end
end
