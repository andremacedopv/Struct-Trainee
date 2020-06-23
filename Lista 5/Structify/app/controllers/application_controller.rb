class ApplicationController < ActionController::Base

  def homepage
    if(cookies.encrypted[:page_accessed])
      @welcome_text = "Bem-Vindo de volta à Structify!"
    else
      cookies.encrypted[:page_accessed] = true
      @welcome_text = "Bem-Vindo à Structify!"
    end
  end

end
