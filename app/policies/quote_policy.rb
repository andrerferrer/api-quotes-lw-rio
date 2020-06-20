class QuotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    record.user = current_user
  end

  def delete?
    record.user = current_user
  end

  def show?
    true
  end
end
