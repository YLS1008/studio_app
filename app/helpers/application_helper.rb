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

  def current_resource
    if current_admin
      return current_admin
    elsif current_instructor
      return current_instructor
    elsif current_user
      return current_user
    else
      return nil
    end
  end

  def actions_helper(resource)
    if resource.class == Admin
      [
       link_to('Dashboard', admin_root_path, class: "nav-link dropdown-toggle btn btn-primary sqs-block-button-element"),
       link_to('תשלומי מדריכים', all_salaries_path, class: "nav-link dropdown-toggle btn btn-primary sqs-block-button-element"),
       link_to('לוח שנה', calendar_path, class: "nav-link dropdown-toggle btn btn-primary sqs-block-button-element"),
       ['רשימות',
       link_to('מתאמנים', trainees_path, class: "dropdown-item btn btn-primary btn-m sqs-block-button-element"),
       link_to('קבוצות', groups_path, class: "dropdown-item btn btn-primary btn-m sqs-block-button-element"),
       link_to('פעילויות', activities_path, class: "dropdown-item btn btn-primary btn-m sqs-block-button-element"),
       link_to('מדריכים', instructors_path, class: "dropdown-item btn btn-primary btn-m sqs-block-button-element"),
      ],
      ['הוסף',
       link_to('הוסף מדריך', new_instructor_registration_path, class: "dropdown-item btn btn-primary btn-m sqs-block-button-element"),
       link_to('הוסף מתאמן', new_trainee_path, class: "dropdown-item btn btn-primary btn-m sqs-block-button-element"),
      ],]

    elsif resource.class == Instructor
      [
        link_to('Dashboard', instructor_root_path, class: "btn btn-primary btn-lg sqs-block-button-element"),
        link_to('תשלומים', salary_path(current_instructor), class: "btn btn-primary btn-lg sqs-block-button-element"),
      ]
    elsif resource.class == User
      []
    end
  end

  def edit_resource_path(resource)
    if resource.class == Admin
      instructors_path
    elsif resource.class == Instructor
      instructor_edit_profile_path(resource)
    elsif resource.class == User
      edit_user_path
    end
  end

  def destroy_resource_session_path(resource)
    if resource.class == Admin
      destroy_admin_session_path
    elsif resource.class == Instructor
      destroy_instructor_session_path
    elsif resource.class == User
      destroy_user_session_path
    end
  end

  
end

