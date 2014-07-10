class CompaniesController < ApplicationController
  respond_to :json

  def index
    companies = Company.by_name
    @company_hash = companies.map do |c|
      {
        id: c.id,
        name: c.name,
        ticker: c.ticker
      }
    end
    render_json
  end

  def show
    company = Company.find_by_id(params[:id])
    if company.present?
      programs = company.programs
      timeline_snippets = company.info_snippets.by_date
      diligence_snippets = company.info_snippets
      @financials =
        {
          price: company.price,
          f52high: company[:'52_week_high'],
          f52low: company[:'52_week_low'],
          cash: company.cash,
          shares_out: company.shares_out,
          three_month_volume: company.three_month_volume,
          burn: company.burn,
          runway: company.runway
        }

      add_calculated_financial(:market_cap, company.price, company.shares_out)
      add_calculated_financial(:three_month_dollar_volume, company.price, company.three_month_volume)

      add_commas_to_large_numbers_in_financials

      @company_hash =
        [{
          id: company.id,
          name: company.name,
          ticker: company.ticker,
          programs: programs,
          financials: @financials,
          timeline_snippets: timeline_snippets,
          diligence_snippets: diligence_snippets
          }]
      render_json
    end
  end

  private

  def add_commas_to_large_numbers_in_financials
    @financials.each {|k,v| @financials[k] = add_commas_to_large_number(v) }
  end

  def add_commas_to_large_number(number)
    number_with_delimiter(number) if number.present?
  end

  def add_calculated_financial(symbol, first_item, second_item)
    @financials = @financials.merge({ symbol => first_item * second_item}) if first_item.present? && second_item.present?
  end

  def render_json
    render :json => @company_hash
  end
end
