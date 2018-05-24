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
    user_is_owner?
  end

  private

  def user_is_owner?
    record.ramen.user == user
  end
end
