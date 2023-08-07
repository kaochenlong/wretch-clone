class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    index?
  end

  def create?
    user
  end

  def update?
    user && owner?
  end

  def destroy?
    update? || admin_user?
  end

  def owner?
    record.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
