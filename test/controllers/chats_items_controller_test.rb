require "test_helper"

class ChatsItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get chats_items_new_url
    assert_response :success
  end

  test "should get create" do
    get chats_items_create_url
    assert_response :success
  end
end
