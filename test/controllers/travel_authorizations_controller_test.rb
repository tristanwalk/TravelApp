require 'test_helper'

class TravelAuthorizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travel_authorization = travel_authorizations(:one)
  end

  test "should get index" do
    get travel_authorizations_url
    assert_response :success
  end

  test "should get new" do
    get new_travel_authorization_url
    assert_response :success
  end

  test "should create travel_authorization" do
    assert_difference('TravelAuthorization.count') do
      post travel_authorizations_url, params: { travel_authorization: {  : @travel_authorization.  } }
    end

    assert_redirected_to travel_authorization_url(TravelAuthorization.last)
  end

  test "should show travel_authorization" do
    get travel_authorization_url(@travel_authorization)
    assert_response :success
  end

  test "should get edit" do
    get edit_travel_authorization_url(@travel_authorization)
    assert_response :success
  end

  test "should update travel_authorization" do
    patch travel_authorization_url(@travel_authorization), params: { travel_authorization: {  : @travel_authorization.  } }
    assert_redirected_to travel_authorization_url(@travel_authorization)
  end

  test "should destroy travel_authorization" do
    assert_difference('TravelAuthorization.count', -1) do
      delete travel_authorization_url(@travel_authorization)
    end

    assert_redirected_to travel_authorizations_url
  end
end
