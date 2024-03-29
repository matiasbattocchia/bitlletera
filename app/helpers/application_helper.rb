module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def paragraphs quantity = 3
    sanitize Forgery(:lorem_ipsum).paragraphs(quantity, {:html => true})
  end
end
