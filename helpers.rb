module Helpers
  def current_user
    authenticated(User)
  end
end
