class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  def update?
    user.present?
  end
  
  def new?
    user.present?
  end
  
  def create?
    user.present?
  end
  
  def edit?
    user.present?
  end
  
  def destroy?
    user.role == 'admin'
  end
end