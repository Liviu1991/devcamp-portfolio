module ApplicationHelper
  def login_helper
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path, class: 'nav-link').html_safe +
        (link_to 'Log in', new_user_session_path, class: 'nav-link')
    else
      link_to 'Log out', destroy_user_session_path, class: 'nav-link', method: :delete
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me on  #{session[:source]}
       you are on #{layout_name} layout"
      content_tag(:p, greeting, class: 'source-greeting')
    end
  end
end
