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
    timeline_snippets = program.info_snippets.by_date_r
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

  def new
    company_id = params[:company_id]
    @drug = Program.new
    companies = Company.by_name
    @companies_list = companies.map { |c| [c.ticker, c.id] }
  end

  def create
    @drug = Program.new(drug_params)

    if @drug.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    drug_id = params.require(:id)
    @drug = Drug.find(drug_id)

    if @drug.update_attributes(drug_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    @drug = Program.find(params[:id])
    @drug.destroy
  end

  private

  def drug_params
    drug_info = params.require(:program)
    drug_info.permit(
      :name,
      :description
    )
    @companies = drug_info[:companies]
  end

  def render_json
    render :json => @program_hash
  end
end
