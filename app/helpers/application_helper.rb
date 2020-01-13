module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
  
  def add_relative_root(path)
    root = Rails.application.config.relative_url_root
    if root.nil?
      path
    else
      uri = URI(path)
      uri.path = File.join(root, uri.path)
      uri.to_s
    end
  end
  
  def check_email
    if User.find_by_email(params[:user_invite][:email])
      return true
    else
      return false
    end
  end
end
