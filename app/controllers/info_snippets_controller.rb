class InfoSnippetsController < ApplicationController

  respond_to :json

  def index
    snippets = params["tag_id"].present? ? Tag.find_by_id(params["tag_id"]).info_snippets.by_update_date : InfoSnippet.by_update_date
    @info_hash = snippets.map do |snippet|
      {
        id: snippet.id,
        subject: snippet.subject,
        text: snippet.text,
        event_date: snippet.event_date,
        has_event_date: snippet.event_date.present?,
        created_at: snippet.created_at,
        updated_at: snippet.updated_at
      }
    end
    render_json
  end

  def show
    snippet = InfoSnippet.find_by_id(params[:id])
    @info_hash =
      [{
        id: snippet.id,
        subject: snippet.subject,
        text: snippet.text,
        event_date: snippet.event_date,
        created_at: snippet.created_at,
        updated_at: snippet.updated_at
      }]
    render_json
  end

  def new
    @info = InfoSnippet.new
    @companies = Company.by_name
    @drugs = Program.by_name
  end

  def create
    @info = InfoSnippet.new(info_snippet_params)

    @info.company_ids = @selected_companies if @selected_companies.present?
    @info.program_ids = @selected_drugs if @selected_drugs.present?
    @info.tag_ids = @selected_tags if @selected_tags.present?

    if @info.save
      redirect_to '/#/snippet'
    else
      @companies = Company.by_name
      @drugs = Program.by_name
      render :new
    end
  end

  def edit
    @info = InfoSnippet.find(params[:id])
    @companies = Company.by_name
    @drugs = Program.by_name
  end

  def update
    snippet_id = params.require(:id)
    @info = InfoSnippet.find(snippet_id)

    @info.company_ids = @selected_companies if @selected_companies.present?
    @info.program_ids = @selected_drugs if @selected_drugs.present?
    @info.tag_ids = @selected_tags if @selected_tags.present?

    if @info.update_attributes(info_snippet_params)
      redirect_to "/#/snippet=#{snippet_id}"
    else
      @companies = Company.by_name
      @drugs = Program.by_name
      render :edit
    end
  end

  def destroy
    @info = InfoSnippet.find(params[:id])
    @info.destroy
  end

  private

  def render_json
    render :json => @info_hash
  end

  def info_snippet_params
    info_snippet = params.require(:info_snippet)

    @selected_companies = info_snippet[:company_ids]
    @selected_drugs = info_snippet[:program_ids]
    @selected_tags = params[:tags]

    info_snippet.permit(
      :subject,
      :text,
      :event_date
    )
  end

end
