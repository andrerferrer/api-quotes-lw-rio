class Api::V1::QuotesController < Api::V1::BaseController
  before_action :set_person, only: %i[ show all ]

  def show
    @quote = @person.quotes.order("RANDOM()").first
  end

  def all; end

  def create
    @quote = Quote.new(params[:quote])
    @person = Person.find_or_create_by(params[:person])
    @quote.person = @person
    @quote.user = current_user
    if @quote.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_person
    @person = Person.find_by_name(params[:slug].downcase)
  end
end
