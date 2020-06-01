class Api::V1::QuotesController < Api::V1::BaseController
  before_action :set_person, only: %i[ show all ]

  def show
    @quote = @person.quotes.order("RANDOM()").first
  end

  def all; end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update(quote_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_person
    @person = Person.find_by_name(params[:slug].downcase)
  end

  def quote_params
    params.require(:quote).permit(:content)
  end

  def render_error
    render json: { errors: @quote.errors.full_messages },
    status: :unprocessable_entity
  end
end
