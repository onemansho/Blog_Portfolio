module ApplicationHelper
  def login_helper
    if current_user.is_a?(GuestUser)
      safe_join(
        [
          link_to("Register", new_user_registration_path,
                  class: "nav-link #{current_page?(new_user_registration_path) ? 'active' : ''}",
                  "aria-current": (current_page?(new_user_registration_path) ? "page" : nil)),
          link_to("Login", new_user_session_path,
                  class: "nav-link #{current_page?(new_user_session_path) ? 'active' : ''}",
                  "aria-current": (current_page?(new_user_session_path) ? "page" : nil))
        ], ""
      )
    else
      # button_to inlined and styled like a link
      button_to(
        "Logout",
        destroy_user_session_path,
        method: :delete,
        form: { class: "d-inline" },
        class: "btn btn-link nav-link p-0",
        data: { turbo_confirm: "Are you sure you want to log out?" }
      )
    end
  end


  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end
end
