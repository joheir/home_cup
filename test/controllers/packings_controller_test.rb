require "test_helper"

class PackingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get packings_show_url
    assert_response :success
  end

  test "should get new" do
    get packings_new_url
    assert_response :success
  end

  test "should get create" do
    get packings_create_url
    assert_response :success
  end

  test "should get edit" do
    get packings_edit_url
    assert_response :success
  end

  test "should get update" do
    get packings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get packings_destroy_url
    assert_response :success
  end
end
