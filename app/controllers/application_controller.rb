class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    if !session[:locale]
      session[:locale] = "en"
    end
  end

end
