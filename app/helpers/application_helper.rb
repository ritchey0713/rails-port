module ApplicationHelper
  
  def login_helper(style="", pad=" ")
    if current_user.is_a?(GuestUser) 
      (link_to "Login", new_user_session_path, class: style) +  
      "#{pad}".html_safe + 
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

  def nav_items 
    [
      {
        url: root_path, 
        title: "Home"
      },
      {
        url: blogs_path, 
        title: "All blogs"
      },
      {
        url: portfolios_path, 
        title: "App portfolio"
      },
      {
        url: about_me_path, 
        title: "About me"
      },
      {
        url: contact_path, 
        title: "Contact"
      },
      {
        url: tech_news_path,
        title: "Tech News"
      },
    ]
  end 

  def nav_helper(style, tag_type)
    nav_links = ''
    nav_items.each do |link|
      nav_links << "<#{tag_type}><a href='#{link[:url]}' class='#{style} #{active?(link[:url])}'>#{link[:title]}</a></#{tag_type}>"

    end 
    nav_links.html_safe
  end 

#   def nav_helper(style, tag_type) 
# nav_links = <<NAV 
# <#{tag_type}><a href='#{root_path}' class="#{style} #{active?(root_path)}"> Home </a></#{tag_type}>
# <#{tag_type}><a href='#{new_blog_path}' class="#{style} #{active?(new_blog_path)}"> Create a blog </a></#{tag_type}>
# <#{tag_type}><a href='#{blogs_path}' class="#{style} #{active?(blogs_path)}"> See all blogs </a></#{tag_type}>
# <#{tag_type}><a href='#{portfolios_path}' class="#{style} #{active?(portfolios_path)}"> App portfolio </a></#{tag_type}>
# <#{tag_type}><a href='#{about_me_path}' class="#{style} #{active?(about_me_path)}"> About me </a></#{tag_type}>
# <#{tag_type}><a href='#{contact_path}' class="#{style} #{active?(contact_path)}"> Contact us </a></#{tag_type}>
# NAV
# nav_links.html_safe
#   end 

  def active?(path)
     "active" if current_page?(path) # current_page is rails method, will check if path is the current page
  end

  def alerts 
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert 
      alert_generator(alert)
    end 
  end 

  def alert_generator(msg)
    js add_gritter(msg, :title => "Alert:", sticky: false) 
  end 

end
