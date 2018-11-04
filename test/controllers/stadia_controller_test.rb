require 'test_helper'

class StadiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stadium = stadia(:one)
  end

  test "should get index" do
    get stadia_url
    assert_response :success
  end

  test "should get new" do
    get new_stadium_url
    assert_response :success
  end

  test "should create stadium" do
    assert_difference('Stadium.count') do
      post stadia_url, params: { stadium: { cep: @stadium.cep, city: @stadium.city, number: @stadium.number, state: @stadium.state, street: @stadium.street, university: @stadium.university } }
    end

    assert_redirected_to stadium_url(Stadium.last)
  end

  test "should show stadium" do
    get stadium_url(@stadium)
    assert_response :success
  end

  test "should get edit" do
    get edit_stadium_url(@stadium)
    assert_response :success
  end

  test "should update stadium" do
    patch stadium_url(@stadium), params: { stadium: { cep: @stadium.cep, city: @stadium.city, number: @stadium.number, state: @stadium.state, street: @stadium.street, university: @stadium.university } }
    assert_redirected_to stadium_url(@stadium)
  end

  test "should destroy stadium" do
    assert_difference('Stadium.count', -1) do
      delete stadium_url(@stadium)
    end

    assert_redirected_to stadia_url
  end
end
