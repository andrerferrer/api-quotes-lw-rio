class QuotePolicy < ApplicationPolicy
  # before_action :check_admin, except: %i[ show ]
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.admin = true
  end

  def update?
    user.admin = true
  end

  def delete?
    user.admin = true
  end

  def show?
    true
  end

  private

  def check_admin
    user.admin = true
  end
end
