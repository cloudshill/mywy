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

  def favorite_tag(favorite_object)
    return "" if current_member.blank?
    class_name = "btn-default"
    state = ""
    title = "收藏"
    id = 0
    if current_member
      favorite = current_member.favorites.where("favoriteable_id = ? AND favoriteable_type = ?", favorite_object.id, favorite_object.class.name).first
      if favorite
        class_name = "btn-danger"
        state = "favorited"
        title = "已收藏"
        id = favorite.id
      end
    end

    html = <<-HTML
      <a class="btn #{class_name}" onclick="return App.addToFavorite(this);" data-o="#{id}" data-state="#{state}" data-type="#{favorite_object.class.name.downcase}s" data-id="#{favorite_object.id}">
        <i class="fa fa-heart fa fa-wishlist-compare"></i>
        #{title}
      </a>
    HTML

    html.html_safe
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
