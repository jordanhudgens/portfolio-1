module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper layout_name
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_helper
      MilanPortfolioCopyright::Renderer.copyright("Milan", "IT370 projekat")
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolio_items_path,
        title: 'Portfolio'
      },
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{check_active(item[:url])}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def check_active path
    "active" if current_page? path
  end

  def alerts_helper
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator_helper alert
    end
  end

  def alert_generator_helper msg
    js add_gritter(msg, sticky: false)
  end

end
