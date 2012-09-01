class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :set_layout

  before_filter :set_locale
   
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private
    def set_layout
      user_signed_in? ? 'inside' : 'outside'
    end

end
