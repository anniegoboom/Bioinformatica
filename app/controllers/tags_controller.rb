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

  def new
    @tag = Tag.new
    @tag_types = TagType.by_name
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to '/#/snippet'
    else
      @tag_types = TagType.by_name
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    @tag_types = TagType.by_name
    @current_type_id = @tag.tag_type_id
  end

  def update
    tag_id = params.require(:id)
    @tag = Tag.find(tag_id)

    if @tag.update_attributes(tag_params)
      redirect_to "/#/tag=#{tag_id}"
    else
      @tag_types = TagType.by_name
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
  end

  private

  def tag_params
    tag_info = params.require(:tag)
    tag_type = tag_info.require(:tag_type_id)

    tag_info.permit(
      :id,
      :name,
      :tag_type_id
    )
  end

  def render_json
    render :json => @tag_hash
  end
end
