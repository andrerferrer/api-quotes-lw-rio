class Api::V1::QuotesController < Api::V1::BaseController
  before_action :set_person, only: %i[ show all ]

  def show
    @quote = @person.quotes.order("RANDOM()").first
  end

  def create
  	@quote = Quote.new( person: Person.first, content: "Testando")
  	@quote.save
  	render :show
  end

  def all; end

  private

  def quote_params
  	params.require(:quote).permit(:person_id, :content)
  end

  def set_person
    @person = Person.find_by_name(params[:slug].downcase)
  end
end
