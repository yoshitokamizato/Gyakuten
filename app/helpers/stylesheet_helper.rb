module StylesheetHelper
  def base_color
    controller_name == "lines" ? "line-color" : "base-color"
  end

  def max_width
    if devise_controller?
      "mw-sm"
    elsif controller_name.in?(%w[my_pages movies]) || (controller_name.in?(%w[texts challenges]) && action_name == "index")
      "mw-xl"
    else
      "mw-md"
    end
  end
end
