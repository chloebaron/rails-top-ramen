class TagPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def edit?
    true
  end

  def destroy
    record.user == user
  end
end
