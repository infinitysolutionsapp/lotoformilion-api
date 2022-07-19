require "test_helper"

class GameCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_category = game_categories(:one)
  end

  test "should get index" do
    get game_categories_url, as: :json
    assert_response :success
  end

  test "should create game_category" do
    assert_difference("GameCategory.count") do
      post game_categories_url, params: { game_category: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show game_category" do
    get game_category_url(@game_category), as: :json
    assert_response :success
  end

  test "should update game_category" do
    patch game_category_url(@game_category), params: { game_category: {  } }, as: :json
    assert_response :success
  end

  test "should destroy game_category" do
    assert_difference("GameCategory.count", -1) do
      delete game_category_url(@game_category), as: :json
    end

    assert_response :no_content
  end
end
