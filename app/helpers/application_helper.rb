module ApplicationHelper

  def set_flash_errors(message)
    flash[:errors] ||= []
    flash[:errors] << message
  end
end
