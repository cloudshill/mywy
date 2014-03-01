module ApplicationHelper
  def notice_message
    flash_messages = []

    flash.each do |type, message|
      type = :success if type == :notice
      text = content_tag(:div, link_to("x", "#", :class => "close", 'data-dismiss' => "alert") + message, :class => "alert alert-danger")
      flash_messages << text if message
    end

    flash_messages.join("\n").html_safe
  end
  
	def active_controller?(c_name = nil)
    raw('class="active"') if controller_name == c_name
  end

  def formattime(time, options = {})
    options[:unit]
    options[:unit] = options[:unit].blank? ? "day" : options[:unit]
    case options[:unit]
    when "day"
      DateTime.parse(time.iso8601).strftime('%Y年%m月%d日') if time
    when "hour"
      DateTime.parse(time.iso8601).strftime('%Y年%m月%d日 %H:%M') if time
    when "noDayOnlyHour"
      DateTime.parse(time.iso8601).strftime('%H:%M') if time
    end
  end

  def category_link(v, node_id, root_id, category_id)
    category = ""
    Category.roots.where(:node_id => node_id).order("id ASC").each do |root|
      if root.id == root_id
        category += "#{category_id}-"
      else
        category += "0-"
      end
    end
    link_to(v, products_path(:node_id => node_id, :category => category))
  end

end
