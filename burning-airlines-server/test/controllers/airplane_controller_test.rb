require 'test_helper'

class AirplaneControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get airplane_new_url
    assert_response :success
  end

  test "should get create" do
    get airplane_create_url
    assert_response :success
  end

  test "should get index" do
    get airplane_index_url
    assert_response :success
  end

  test "should get show" do
    get airplane_show_url
    assert_response :success
  end

end
