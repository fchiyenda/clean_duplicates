require 'test_helper'

class PersonAttributeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_attribute_type = person_attribute_types(:one)
  end

  test "should get index" do
    get person_attribute_types_url
    assert_response :success
  end

  test "should get new" do
    get new_person_attribute_type_url
    assert_response :success
  end

  test "should create person_attribute_type" do
    assert_difference('PersonAttributeType.count') do
      post person_attribute_types_url, params: { person_attribute_type: { changed_by: @person_attribute_type.changed_by, creator: @person_attribute_type.creator, date_changed: @person_attribute_type.date_changed, date_created: @person_attribute_type.date_created, date_retired: @person_attribute_type.date_retired, description: @person_attribute_type.description, edit_privilege: @person_attribute_type.edit_privilege, foreign_key: @person_attribute_type.foreign_key, format: @person_attribute_type.format, name: @person_attribute_type.name, person_attribute_type_id: @person_attribute_type.person_attribute_type_id, retire_reason: @person_attribute_type.retire_reason, retired: @person_attribute_type.retired, retired_by: @person_attribute_type.retired_by, searchable: @person_attribute_type.searchable, sort_weight: @person_attribute_type.sort_weight, uuid: @person_attribute_type.uuid } }
    end

    assert_redirected_to person_attribute_type_url(PersonAttributeType.last)
  end

  test "should show person_attribute_type" do
    get person_attribute_type_url(@person_attribute_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_attribute_type_url(@person_attribute_type)
    assert_response :success
  end

  test "should update person_attribute_type" do
    patch person_attribute_type_url(@person_attribute_type), params: { person_attribute_type: { changed_by: @person_attribute_type.changed_by, creator: @person_attribute_type.creator, date_changed: @person_attribute_type.date_changed, date_created: @person_attribute_type.date_created, date_retired: @person_attribute_type.date_retired, description: @person_attribute_type.description, edit_privilege: @person_attribute_type.edit_privilege, foreign_key: @person_attribute_type.foreign_key, format: @person_attribute_type.format, name: @person_attribute_type.name, person_attribute_type_id: @person_attribute_type.person_attribute_type_id, retire_reason: @person_attribute_type.retire_reason, retired: @person_attribute_type.retired, retired_by: @person_attribute_type.retired_by, searchable: @person_attribute_type.searchable, sort_weight: @person_attribute_type.sort_weight, uuid: @person_attribute_type.uuid } }
    assert_redirected_to person_attribute_type_url(@person_attribute_type)
  end

  test "should destroy person_attribute_type" do
    assert_difference('PersonAttributeType.count', -1) do
      delete person_attribute_type_url(@person_attribute_type)
    end

    assert_redirected_to person_attribute_types_url
  end
end
