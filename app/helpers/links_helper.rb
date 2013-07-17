module LinksHelper
  def already_voted?
    !!UserVote.find_by_link_id_and_user_id(params[:link_id], current_user.id)
  end

  def already_voted!
    if already_voted?
      UserVote.find_by_link_id_and_user_id(params[:link_id], current_user.id).destroy
      redirect_to :back
    end
  end
end