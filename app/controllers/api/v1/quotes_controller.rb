class Api::V1::QuotesController < Api::V1::BaseController
  before_action :set_person, only: %i[ show all ]

  def show
    @quote = @person.quotes.order("RANDOM()").first
  end

  def all; end

  def create
    @quote = Quote.new(content: params[:quote])
    @quote.person = Person.find_or_create_by(name: params[:person])
    if @quote.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def quote_params
  	params.require(:quote).permit(:person_id, :content)
  end

  def set_person
    @person = Person.find_by_name(params[:slug].downcase)
  end
end
