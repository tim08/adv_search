require 'test_helper'

class PromoRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promo_request = promo_requests(:one)
  end

  test "should get index" do
    get promo_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_promo_request_url
    assert_response :success
  end

  test "should create promo_request" do
    assert_difference('PromoRequest.count') do
      post promo_requests_url, params: { promo_request: { contact_details: @promo_request.contact_details, description: @promo_request.description, min_order_price: @promo_request.min_order_price, name: @promo_request.name, town: @promo_request.town } }
    end

    assert_redirected_to promo_request_url(PromoRequest.last)
  end

  test "should show promo_request" do
    get promo_request_url(@promo_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_promo_request_url(@promo_request)
    assert_response :success
  end

  test "should update promo_request" do
    patch promo_request_url(@promo_request), params: { promo_request: { contact_details: @promo_request.contact_details, description: @promo_request.description, min_order_price: @promo_request.min_order_price, name: @promo_request.name, town: @promo_request.town } }
    assert_redirected_to promo_request_url(@promo_request)
  end

  test "should destroy promo_request" do
    assert_difference('PromoRequest.count', -1) do
      delete promo_request_url(@promo_request)
    end

    assert_redirected_to promo_requests_url
  end
end
