require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "should get index" do
    locales.each do |locale|
      get :index, locale: locale
      assert_response :success
    end
  end

end
