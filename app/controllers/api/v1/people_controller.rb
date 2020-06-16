class Api::V1::PeopleController < Api::V1::BaseController

  def index
    @people = Person.all
    # @people = policy_scope(People)
  end

  def show
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(person_params)
    # @person.user = current_user
    # authorize @person - policy with user == admin?
    if @person.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def person_params
    params.require(:person).permit(:name)
  end

end
