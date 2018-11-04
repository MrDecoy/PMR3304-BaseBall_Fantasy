require 'test_helper'

class CartolasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cartola = cartolas(:one)
  end

  test "should get index" do
    get cartolas_url
    assert_response :success
  end

  test "should get new" do
    get new_cartola_url
    assert_response :success
  end

  test "should create cartola" do
    assert_difference('Cartola.count') do
      post cartolas_url, params: { cartola: { arremessador_id: @cartola.arremessador_id, nome: @cartola.nome, player_1_id: @cartola.player_1_id, player_2_id: @cartola.player_2_id, player_3_id: @cartola.player_3_id, player_4_id: @cartola.player_4_id, player_5_id: @cartola.player_5_id, player_6_id: @cartola.player_6_id, player_7_id: @cartola.player_7_id, player_8_id: @cartola.player_8_id } }
    end

    assert_redirected_to cartola_url(Cartola.last)
  end

  test "should show cartola" do
    get cartola_url(@cartola)
    assert_response :success
  end

  test "should get edit" do
    get edit_cartola_url(@cartola)
    assert_response :success
  end

  test "should update cartola" do
    patch cartola_url(@cartola), params: { cartola: { arremessador_id: @cartola.arremessador_id, nome: @cartola.nome, player_1_id: @cartola.player_1_id, player_2_id: @cartola.player_2_id, player_3_id: @cartola.player_3_id, player_4_id: @cartola.player_4_id, player_5_id: @cartola.player_5_id, player_6_id: @cartola.player_6_id, player_7_id: @cartola.player_7_id, player_8_id: @cartola.player_8_id } }
    assert_redirected_to cartola_url(@cartola)
  end

  test "should destroy cartola" do
    assert_difference('Cartola.count', -1) do
      delete cartola_url(@cartola)
    end

    assert_redirected_to cartolas_url
  end
end
