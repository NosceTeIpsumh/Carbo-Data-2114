require "test_helper"

class RecipeItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recipe_items_new_url
    assert_response :success
  end

  test "should get create" do
    get recipe_items_create_url
    assert_response :success
  end
end
