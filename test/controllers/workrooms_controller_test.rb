require 'test_helper'

class WorkroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workroom = workrooms(:one)
  end

  test "should get index" do
    get workrooms_url
    assert_response :success
  end

  test "should get new" do
    get new_workroom_url
    assert_response :success
  end

  test "should create workroom" do
    assert_difference('Workroom.count') do
      post workrooms_url, params: { workroom: { building_id: @workroom.building_id, code: @workroom.code, name: @workroom.name } }
    end

    assert_redirected_to workroom_url(Workroom.last)
  end

  test "should show workroom" do
    get workroom_url(@workroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_workroom_url(@workroom)
    assert_response :success
  end

  test "should update workroom" do
    patch workroom_url(@workroom), params: { workroom: { building_id: @workroom.building_id, code: @workroom.code, name: @workroom.name } }
    assert_redirected_to workroom_url(@workroom)
  end

  test "should destroy workroom" do
    assert_difference('Workroom.count', -1) do
      delete workroom_url(@workroom)
    end

    assert_redirected_to workrooms_url
  end
end
