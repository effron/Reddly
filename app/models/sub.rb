class Sub < ActiveRecord::Base
  attr_accessible :name, :user_id, :links_attributes

  belongs_to :user
  has_many :link_subs
  has_many :links, through: :link_subs

  accepts_nested_attributes_for :links, reject_if: :all_blank
end
