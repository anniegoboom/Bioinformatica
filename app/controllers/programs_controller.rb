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
    @drug = Program.new
    @companies = Company.by_name

    @drug.company_ids = params[:company_id]
  end

  def create
    @drug = Program.new(drug_params)
    @drug.company_ids = @selected_company if @selected_company.present?

    if @drug.save
      redirect_to '/#/drug'
    else
      render :new
    end
  end

  def edit
    @drug = Program.find(params[:id])
    @companies = Company.by_name
  end

  def update
    update_params = drug_params
    @drug = Program.find(params.require(:id))

    @drug.company_ids = @selected_company if @selected_company.present?

    if @drug.update_attributes(update_params)
      redirect_to "/#/drug=#{@drug.id}"
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

    @selected_company = drug_info[:company_ids] || @selected_company
    @selected_tags
    @selected_snippets

    drug_info.permit(
      :id,
      :name,
      :description,
      :companies
    )
  end

  def render_json
    render :json => @program_hash
  end
end
