class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def dashboard?
    user_is_owner?
  end

  private

  def user_is_owner?
    record == user
  end
end
