module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path, class: style).html_safe +
        (link_to 'Log in', new_user_session_path, class: style)
    else
      link_to 'Log out', destroy_user_session_path, class: style, method: :delete
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me on  #{session[:source]}
       you are on #{layout_name} layout"
      content_tag(:p, greeting, class: 'source-greeting')
    end
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Please pay attention!")
  end
end
