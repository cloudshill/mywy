module FavoritesHelper
	def favorites_tag(product, opts = {})
    return "" if product.blank?

    if current_member && product.favorited_by_member?(current_member)
      title = "取消收藏"
      state = "favorited"
      link_to("","#",:title => title, :rel => "twipsy", 'data-state' => state,'data-id' => product.id,
            :class => 'fa fa-heart product-icon-active', :onclick => "return App.addToFavorite(this);",
             "data-placement"=>"top", "data-toggle"=>"tooltip", "data-original-title"=>title)
    else
      title = "收藏"
      state = ""
      link_to("","#",:title => title, :rel => "twipsy", 'data-state' => state, 'data-id' => product.id,
            :class => 'fa fa-heart product-icon', :onclick => "return App.addToFavorite(this);",
             "data-placement"=>"top", "data-toggle"=>"tooltip", "data-original-title"=>title)
    end
  end
end