require 'test_helper'

class CirclesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get circles_index_url
    assert_response :success
  end

  test "should get show" do
    get circles_show_url
    assert_response :success
  end

  test "should get new" do
    get circles_new_url
    assert_response :success
  end

  test "should get create" do
    get circles_create_url
    assert_response :success
  end

  test "should get edit" do
    get circles_edit_url
    assert_response :success
  end

  test "should get update" do
    get circles_update_url
    assert_response :success
  end

  test "should get calendar" do
    get circles_calendar_url
    assert_response :success
  end

  test "should get map" do
    get circles_map_url
    assert_response :success
  end

  test "should get member" do
    get circles_member_url
    assert_response :success
  end

  test "should get approvals" do
    get circles_approvals_url
    assert_response :success
  end

end
