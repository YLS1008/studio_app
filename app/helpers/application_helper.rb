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

  
end

