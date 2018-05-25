class TastePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    record.portion.ramen.user = user
  end

end
