require "test_helper"

class GameHousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_house = game_houses(:one)
  end

  test "should get index" do
    get game_houses_url, as: :json
    assert_response :success
  end

  test "should create game_house" do
    assert_difference("GameHouse.count") do
      post game_houses_url, params: { game_house: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show game_house" do
    get game_house_url(@game_house), as: :json
    assert_response :success
  end

  test "should update game_house" do
    patch game_house_url(@game_house), params: { game_house: {  } }, as: :json
    assert_response :success
  end

  test "should destroy game_house" do
    assert_difference("GameHouse.count", -1) do
      delete game_house_url(@game_house), as: :json
    end

    assert_response :no_content
  end
end
