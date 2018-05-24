class FavouritePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    user_is_owner_of_ramen?
  end

  private

  def user_is_owner_of_ramen?
    record.ramen.user == user
  end
end

