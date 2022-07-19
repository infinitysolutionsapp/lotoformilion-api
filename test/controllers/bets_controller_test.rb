require "test_helper"

class BetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bet = bets(:one)
  end

  test "should get index" do
    get bets_url, as: :json
    assert_response :success
  end

  test "should create bet" do
    assert_difference("Bet.count") do
      post bets_url, params: { bet: { Game_id: @bet.Game_id, dozens: @bet.dozens, move: @bet.move, result: @bet.result, simulations: @bet.simulations } }, as: :json
    end

    assert_response :created
  end

  test "should show bet" do
    get bet_url(@bet), as: :json
    assert_response :success
  end

  test "should update bet" do
    patch bet_url(@bet), params: { bet: { Game_id: @bet.Game_id, dozens: @bet.dozens, move: @bet.move, result: @bet.result, simulations: @bet.simulations } }, as: :json
    assert_response :success
  end

  test "should destroy bet" do
    assert_difference("Bet.count", -1) do
      delete bet_url(@bet), as: :json
    end

    assert_response :no_content
  end
end
