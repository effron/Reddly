class Comment < ActiveRecord::Base
  attr_accessible :body, :link_id, :parent_comment_id, :user_id

  belongs_to :link
  belongs_to :user
  belongs_to :parent_comment, class_name: "Comment"
  has_many :child_comments, class_name: "Comment",
                            foreign_key: :parent_comment_id

  def comments_by_parent
    comments = Hash.new { |hash, key| hash[key] = [] }
    Comment.find_all_by_link_id(link_id).each do |comment|
      comments[comment.parent_comment_id] << comment
    end

    comments
  end

  def self.comments_by_parent(link_id)
    comments = Hash.new { |hash, key| hash[key] = [] }
    Comment.where("link_id = ?", link_id).each do |comment|
      comments[comment.parent_comment_id] << comment
    end

    comments
  end

end
