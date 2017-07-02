class UserPolicy < ApplicationPolicy

  def show?
    return true if record.id == user.id
  end

  def create?
    return true
  end

  def update?
    return true if record.id == user.id
  end

  def destroy?
    return true if record.user_id == user.id
  end

  def edit?
    update?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

end