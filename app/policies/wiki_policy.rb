class WikiPolicy < ApplicationPolicy
  def destroy?
    user.role == 'admin'
  end
end