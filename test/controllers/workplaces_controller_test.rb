require 'test_helper'

class WorkplacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workplace = workplaces(:one)
  end

  test "should get index" do
    get workplaces_url
    assert_response :success
  end

  test "should get new" do
    get new_workplace_url
    assert_response :success
  end

  test "should create workplace" do
    assert_difference('Workplace.count') do
      post workplaces_url, params: { workplace: { code: @workplace.code, name: @workplace.name, workroom_id: @workplace.workroom_id } }
    end

    assert_redirected_to workplace_url(Workplace.last)
  end

  test "should show workplace" do
    get workplace_url(@workplace)
    assert_response :success
  end

  test "should get edit" do
    get edit_workplace_url(@workplace)
    assert_response :success
  end

  test "should update workplace" do
    patch workplace_url(@workplace), params: { workplace: { code: @workplace.code, name: @workplace.name, workroom_id: @workplace.workroom_id } }
    assert_redirected_to workplace_url(@workplace)
  end

  test "should destroy workplace" do
    assert_difference('Workplace.count', -1) do
      delete workplace_url(@workplace)
    end

    assert_redirected_to workplaces_url
  end
end
