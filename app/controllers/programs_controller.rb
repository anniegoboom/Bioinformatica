class ProgramsController < ApplicationController
  respond_to :json

  def index
    programs = params["tag_id"].present? ? Tag.find_by_id(params["tag_id"]).programs.by_name : Program.by_name
    @program_hash = programs.map do |p|
      {
        id: p.id,
        name: p.name
      }
    end
    render_json
  end

  def show
    program = Program.find_by_id(params[:id])
    companies = program.companies.map do |c|
      {
        id: c.id,
        name: c.name
      }
    end
    timeline_snippets = program.info_snippets.by_date
    @program_hash =
      [{
        id: program.id,
        name: program.name,
        description: program.description,
        timeline_snippets: timeline_snippets,
        companies: companies
        }]
    render_json
  end

  private

  def render_json
    render :json => @program_hash
  end
end
