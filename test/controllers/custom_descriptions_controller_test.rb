require 'test_helper'

class CustomDescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @custom_description = custom_descriptions(:one)
  end

  test "should get index" do
    get custom_descriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_custom_description_url
    assert_response :success
  end

  test "should create custom_description" do
    assert_difference('CustomDescription.count') do
      post custom_descriptions_url, params: { custom_description: { body: @custom_description.body, name: @custom_description.name } }
    end

    assert_redirected_to custom_description_url(CustomDescription.last)
  end

  test "should show custom_description" do
    get custom_description_url(@custom_description)
    assert_response :success
  end

  test "should get edit" do
    get edit_custom_description_url(@custom_description)
    assert_response :success
  end

  test "should update custom_description" do
    patch custom_description_url(@custom_description), params: { custom_description: { body: @custom_description.body, name: @custom_description.name } }
    assert_redirected_to custom_description_url(@custom_description)
  end

  test "should destroy custom_description" do
    assert_difference('CustomDescription.count', -1) do
      delete custom_description_url(@custom_description)
    end

    assert_redirected_to custom_descriptions_url
  end
end
