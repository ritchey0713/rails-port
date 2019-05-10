module ApplicationHelper
  
  def login_helper(style="")
    if current_user.is_a?(GuestUser) 
      (link_to "Login", new_user_session_path, class: style) +  
      " ".html_safe + 
      (link_to "Register", new_user_registration_path, class: style) 
    else 
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
      
    end 
  end 

  def source_helper(layout_name)
    if session[:source]
      content_tag(:p, "Thanks for visiting from #{session[:source]} and you came to the #{layout_name} layout", class: "source-greeting")
    end 
  end


  def copyright_generator
    @copyright = RitcheySolutionViewtool::Renderer.copyright("Dj Ritchey", "All Rights Reserved")
  end 
  

end
