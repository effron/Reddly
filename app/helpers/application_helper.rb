module ApplicationHelper

  def set_flash_errors(message)
    flash[:errors] ||= []
    flash[:errors] << message
  end

  def order_links
    Link.select("links.*, COALESCE(SUM(user_votes.vote), 0) AS sum").
    joins("LEFT OUTER JOIN user_votes ON user_votes.link_id = links.id").
    group("links.id").
    order("sum").reverse_order

  end
end
