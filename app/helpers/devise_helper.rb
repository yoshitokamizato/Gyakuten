module DeviseHelper
  def devise_error_messages!
    return "" if flash.empty?

    html = ""

    flash.each do |name, msg|
      next unless name == "alert"

      html += <<-HTML
          <div class="alert alert-error alert-danger"> <button type="button"
          class="close" data-dismiss="alert">x</button>
            #{msg}
          </div>
      HTML
    end

    html.html_safe
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
