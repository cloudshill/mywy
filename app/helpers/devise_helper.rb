module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:div, link_to("x", "#", :class => "close", 'data-dismiss' => "alert") + msg, :class => "alert alert-danger") }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
      #{messages}
    HTML

    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end