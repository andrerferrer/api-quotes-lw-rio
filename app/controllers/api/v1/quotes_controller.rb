class Api::V1::QuotesController < Api::V1::BaseController
  before_action :set_person, only: %i[ show all ]

  def show
    @quote = @person.quotes.order("RANDOM()").first
  end

<<<<<<< HEAD
  def all; end

=======

  def all; end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update(quote_params)
      render :show
    else
      render_error
    end
  end

>>>>>>> 3e783c9f797d652bf71fa47210debe88c8a7f436
  def create
    @quote = Quote.new(content: params[:quote])
    @quote.person = Person.find_by(name: params[:person].downcase)
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
