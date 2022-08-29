require "test_helper"

class ProfileTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profile_tasks_index_url
    assert_response :success
  end

  test "should get edit" do
    get profile_tasks_edit_url
    assert_response :success
  end

  test "should get update" do
    get profile_tasks_update_url
    assert_response :success
  end
end
