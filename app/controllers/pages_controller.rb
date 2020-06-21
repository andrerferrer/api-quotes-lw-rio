class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def admin
    @people = Person.all
    respond_to do |format|
      format.html
      format.json { render json: { people: @people } }
   end
  end

end
