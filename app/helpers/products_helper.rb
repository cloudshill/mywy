module ProductsHelper
		def render_option_of_total_category(node_id, root_id)
      p = request.query_parameters.to_hash
      p.delete "page"
      
      category = ""
      if p["category"].blank?
        Category.roots.where(:node_id => node_id).order("id ASC").each do |root|
          category += "0-"
        end
      else
        categorys = p["category"].split("-").delete_if { |c| c==""}
        sort = 0
        Category.roots.where(:node_id => node_id).order("id ASC").each do |root|
          if root.id == root_id
            category += "0-"
          else
            category += categorys[sort] + "-"
          end
          sort += 1
        end
      end
      link_to("不限", products_path(p.merge("node_id" => node_id, "category" => category)))
    end
    
    def render_option_of_single_category(k, v, node_id, root_id)
      p = request.query_parameters.to_hash
      p.delete "page"
      category = ""
      if p["category"].blank?
        Category.roots.where(:node_id => node_id).order("id ASC").each do |root|
          if root.id == root_id
            category += "#{k}-"
          else
            category += "0-"
          end
        end
      else
        categorys = p["category"].split("-").delete_if { |c| c==""}
        sort = 0
        Category.roots.where(:node_id => node_id).order("id ASC").each do |root|
          if root.id == root_id
            category += "#{k}-"
          else
            category += categorys[sort] + "-"
          end
          sort += 1
        end
      end
      link_to(v, products_path(p.merge("node_id" => node_id, "category" => category)))
    end
end
