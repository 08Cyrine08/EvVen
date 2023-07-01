class VenuePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def update?
    record.user == user
    # record: the venue passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def destroy?
    record.user == user
  end
end
