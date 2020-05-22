class Api::V1::QuotesController < Api::V1::BaseController
  def show
    @person = Person.find_by_name(params[:slug].downcase)
    @quote = Quote.where(person_id: @person.id).order("RANDOM()").first
  end
end
