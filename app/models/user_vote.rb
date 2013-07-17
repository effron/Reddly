class UserVote < ActiveRecord::Base
  attr_accessible :link_id, :user_id, :vote

  belongs_to :user
  belongs_to :link

  def self.sum_votes(link_id)
    UserVote.find_all_by_link_id(link_id).inject(0) do |sum, uservote|
      sum + uservote.vote
    end
  end
end
