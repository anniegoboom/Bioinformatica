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
      @financials =
        {
          price: company.price,
          f52high: company[:'52_week_high'],
          f52low: company[:'52_week_low'],
          cash: company.cash,
          shares_out: company.shares_out,
          three_month_volume: company.three_month_volume,
          burn: company.burn,
          debt: company.debt,
          debt_due: company.debt_due
        }

      add_calculated_financial(:market_cap, company.price, company.shares_out, "*")
      add_calculated_financial(:three_month_dollar_volume, company.price, company.three_month_volume, "*")
      add_calculated_financial(:runway, company.cash, company.burn, '/')

      programs = company.programs.map do |p|
        {
          id: p.id,
          name: p.name,
          description: p.description,
          tags: p.tags
        }
      end

      snippets = company.info_snippets.by_date_r
      timeline_snippets = snippets.select {|s| s.event_date.present?}
      diligence_snippets = snippets - timeline_snippets

      @company_hash =
        [{
          id: company.id,
          name: company.name,
          ticker: company.ticker,
          programs: programs,
          financials: @financials,
          timeline_snippets: timeline_snippets,
          diligence_snippets: diligence_snippets,
          other: company.other
          }]
      render_json
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company_id = params.require(:id)
    @company = Company.find(company_id)

    if @company.update_attributes(company_params)
      redirect_to "/#/company=#{company_id}"
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
  end

  private

  def add_commas_to_large_numbers_in_financials
    @financials.each {|k,v| @financials[k] = add_commas_to_large_number(v) }
  end

  def add_calculated_financial(symbol, first_item, second_item, operation)
    return nil unless first_item.present? && second_item.present? && operation.present?

    case operation
    when "*"
      @financials = @financials.merge({ symbol => first_item * second_item})
    when "/"
      return nil if second_item < 1
      @financials = @financials.merge({ symbol => first_item / second_item})
    else
      nil
    end
  end

  def company_params
    company_info = params.require(:company)
    company_info.permit(
      :name,
      :ticker,
      :price,
      :'52_week_high',
      :'52_week_low',
      :cash,
      :shares_out,
      :three_month_volume,
      :debt,
      :debt_due,
      :burn,
      :other
    )
  end

  def render_json
    render :json => @company_hash
  end
end
