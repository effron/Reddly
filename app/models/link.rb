class Link < ActiveRecord::Base
  attr_accessible :body, :title, :url, :user_id, :sub_ids, :comments_attributes

  belongs_to :user
  has_many :link_subs
  has_many :subs, through: :link_subs
  has_many :comments
  has_many :user_votes

  accepts_nested_attributes_for :comments, reject_if: :all_blank
  validates :title, :url, presence: true

  def score
    UserVote.sum_votes(id)
  end

end
