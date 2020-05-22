class Api::V1::QuotesController < Api::V1::BaseController
  def show
    @person = Person.find_by_name(params[:slug].downcase)
    @quote = @person.quotes.order("RANDOM()").first
  end
end
