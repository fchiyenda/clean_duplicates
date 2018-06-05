require 'test_helper'

class PersonAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_attribute = person_attributes(:one)
  end

  test "should get index" do
    get person_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_person_attribute_url
    assert_response :success
  end

  test "should create person_attribute" do
    assert_difference('PersonAttribute.count') do
      post person_attributes_url, params: { person_attribute: { changed_by: @person_attribute.changed_by, creator: @person_attribute.creator, date_changed: @person_attribute.date_changed, date_created: @person_attribute.date_created, date_voided: @person_attribute.date_voided, person_attribute_id: @person_attribute.person_attribute_id, person_attribute_type_id: @person_attribute.person_attribute_type_id, person_id: @person_attribute.person_id, uuid: @person_attribute.uuid, value: @person_attribute.value, voided: @person_attribute.voided, voided_by: @person_attribute.voided_by, voided_reason: @person_attribute.voided_reason } }
    end

    assert_redirected_to person_attribute_url(PersonAttribute.last)
  end

  test "should show person_attribute" do
    get person_attribute_url(@person_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_attribute_url(@person_attribute)
    assert_response :success
  end

  test "should update person_attribute" do
    patch person_attribute_url(@person_attribute), params: { person_attribute: { changed_by: @person_attribute.changed_by, creator: @person_attribute.creator, date_changed: @person_attribute.date_changed, date_created: @person_attribute.date_created, date_voided: @person_attribute.date_voided, person_attribute_id: @person_attribute.person_attribute_id, person_attribute_type_id: @person_attribute.person_attribute_type_id, person_id: @person_attribute.person_id, uuid: @person_attribute.uuid, value: @person_attribute.value, voided: @person_attribute.voided, voided_by: @person_attribute.voided_by, voided_reason: @person_attribute.voided_reason } }
    assert_redirected_to person_attribute_url(@person_attribute)
  end

  test "should destroy person_attribute" do
    assert_difference('PersonAttribute.count', -1) do
      delete person_attribute_url(@person_attribute)
    end

    assert_redirected_to person_attributes_url
  end
end
