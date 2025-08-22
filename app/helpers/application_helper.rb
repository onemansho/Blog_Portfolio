module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      safe_join(
        [
          link_to(
            "Register",
            new_user_registration_path,
            class: "nav-link #{current_page?(new_user_registration_path) ? 'active' : ''}",
            "aria-current": (current_page?(new_user_registration_path) ? "page" : nil)
          ),
          link_to(
            "Login",
            new_user_session_path,
            class: "nav-link #{current_page?(new_user_session_path) ? 'active' : ''}",
            "aria-current": (current_page?(new_user_session_path) ? "page" : nil)
          )
        ],
        "" # no separator so they render as adjacent nav items
      )
    else
      # Use link_to with method: :delete for consistent styling with other nav links
      
      button_to(
        "Logout",
        destroy_user_session_path,
        method: :delete,
        form: { class: "d-inline" },
        class: "btn btn-link nav-link p-0 lgt",
        data: { turbo_confirm: "Are you sure you want to log out?" }
      )
    end
  end
  
  
    #How can i pass specific data to the view -->
    def source_helper(layout_name)
        if session[:source] 
          greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
         content_tag(:p , greeting, class: "source-greeting")
        end   
  end
end 


