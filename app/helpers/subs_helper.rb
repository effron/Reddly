module SubsHelper
  def authorize_moderator(sub)
    unless sub.user_id == current_user.id
      logout
      redirect_to new_session_url
    end
  end
end