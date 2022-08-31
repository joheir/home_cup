require "test_helper"

class MealsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meals_index_url
    assert_response :success
  end

  test "should get destroy" do
    get meals_destroy_url
    assert_response :success
  end
end
