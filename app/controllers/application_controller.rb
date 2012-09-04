class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  layout :set_layout
   
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private
  
  def set_layout
    user_signed_in? ? 'inside' : 'outside'
  end

end
