class WikiPolicy < ApplicationPolicy
  def destroy?
    wiki.user = current_user || user.role == 'admin'
  end
end