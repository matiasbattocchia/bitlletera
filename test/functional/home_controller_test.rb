require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "should get index" do
    %w{es es-AR en pt pt-BR}.each do |locale|
      get :index, locale: locale
      assert_response :success
    end
  end

end
