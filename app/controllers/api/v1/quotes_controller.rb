class Api::V1::QuotesController < Api::V1::BaseController
  before_action :set_person, only: %i[ show all update]

  def show
    @quote = @person.quotes.order("RANDOM()").first
  end

  def all; end

  def update
    @quote = Quote.find(params[:id])
    @quote.update(quote_params)
    render :show
  end

  private

  def set_person
    @person = Person.find_by_name(params[:slug])
  end

  def quote_params
    params.require(:quote).permit(:content)
  end

end
