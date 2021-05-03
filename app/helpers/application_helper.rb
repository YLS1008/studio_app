module ApplicationHelper
# Returns the full title on a per-page basis.
  def full_title(page_title = '')
      base_title = "The Studio"
      if page_title.empty?
        base_title
      else
        page_title + " | " + base_title
      end
  end

  def anyone_signed_in?
    admin_signed_in? || instructor_signed_in? || user_signed_in?
  end

  def root_path_helper
    if current_user
      user_root_path
    elsif current_instructor
      instructor_root_path
    elsif current_admin
      admin_root_path
    else
      root_path
    end
  end

  def daynum_to_hebrew_day(num)
    case num
    when 0
      "יום ראשון"
    when 1
      "יום שני"
    when 2
      "יום שלישי"
    when 3
      "יום רביעי"
    when 4
      "יום חמישי"
    when 5
      "יום שישי"
    when 6
      "יום שבת"
    
    end
  end

  def dropdown_links(btn_writing, color, resource_hash)
    color_string = "color: " + color + ' ' + '!important' ';'
    x =

    "<div>
    <button class=#{"btn btn-main dropdown-toggle"}  type=#{"button"} id=#{"dropdownMenuButton"} data-toggle=#{"dropdown"} aria-haspopup=#{"true"} aria-expanded=#{"false"}>
        <span style=#{color_string}> #{btn_writing} </span>
    </button>

    
    <ul class=#{"dropdown-menu no-bullets"} style=#{"background-color: info;"}>

        <% #{resource_hash}.each do |name, path| %>
        <li>
            <%= link_to name, path, class: #{"btn btn-main"}  %>
        </li>
        <% end %>
    </ul>
    </div>"
    return x.html_safe
  end

  
end

