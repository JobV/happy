module ApplicationHelper
  def navlinkclass(page_name)
    if instance_variable_get("@#{page_name}")
      'active item'
    else
      'item'
    end
  end
end
