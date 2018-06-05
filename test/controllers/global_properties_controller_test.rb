require 'test_helper'

class GlobalPropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @global_property = global_properties(:one)
  end

  test "should get index" do
    get global_properties_url
    assert_response :success
  end

  test "should get new" do
    get new_global_property_url
    assert_response :success
  end

  test "should create global_property" do
    assert_difference('GlobalProperty.count') do
      post global_properties_url, params: { global_property: { description: @global_property.description, property: @global_property.property, property_value: @global_property.property_value, uuid: @global_property.uuid } }
    end

    assert_redirected_to global_property_url(GlobalProperty.last)
  end

  test "should show global_property" do
    get global_property_url(@global_property)
    assert_response :success
  end

  test "should get edit" do
    get edit_global_property_url(@global_property)
    assert_response :success
  end

  test "should update global_property" do
    patch global_property_url(@global_property), params: { global_property: { description: @global_property.description, property: @global_property.property, property_value: @global_property.property_value, uuid: @global_property.uuid } }
    assert_redirected_to global_property_url(@global_property)
  end

  test "should destroy global_property" do
    assert_difference('GlobalProperty.count', -1) do
      delete global_property_url(@global_property)
    end

    assert_redirected_to global_properties_url
  end
end
