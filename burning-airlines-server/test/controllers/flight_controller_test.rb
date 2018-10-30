require 'test_helper'

class FlightControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get flight_create_url
    assert_response :success
  end

  test "should get new" do
    get flight_new_url
    assert_response :success
  end

  test "should get index" do
    get flight_index_url
    assert_response :success
  end

end
