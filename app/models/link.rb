class Link < ActiveRecord::Base
  attr_accessible :body, :title, :url, :user_id, :sub_ids

  belongs_to :user
  has_many :link_subs
  has_many :subs, through: :link_sub
end
