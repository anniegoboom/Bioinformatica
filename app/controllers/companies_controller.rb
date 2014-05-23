class CompaniesController < ApplicationController
  respond_to :json

  def index
    companies = Company.by_name
    @company_hash = companies.map do |c|
      {
        id: c.id,
        name: c.name
      }
    end
    render_json
  end

  def show
    company = Company.find_by_id(params[:id])
    programs = company.programs
    timeline_snippets = company.info_snippets.by_date
    diligence_snippets = company.info_snippets
    financials =
      {
        price = company.price,
        52high = company[:'52_week_high'],
        52low = company[:'52_week_low'],
        cash = company.cash,
        market_cap = company.market_cap,
        shares_out = company.shares_out,
        burn = company.burn,
        runway = company.runway
      }
    @company_hash =
      [{
        id: company.id,
        name: company.name,
        programs: programs,
        financials: financials,
        timeline_snippets: timeline_snippets,
        diligence_snippets: diligence_snippets
        }]
    render_json
  end

  private

  def render_json
    render :json => @company_hash
  end
end
