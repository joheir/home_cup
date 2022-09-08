require "test_helper"

class ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get chats_new_url
    assert_response :success
  end

  test "should get create" do
    get chats_create_url
    assert_response :success
  end

  test "should get edit" do
    get chats_edit_url
    assert_response :success
  end

  test "should get update" do
    get chats_update_url
    assert_response :success
  end
end
