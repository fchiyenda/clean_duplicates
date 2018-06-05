require 'test_helper'

class PersonNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_name = person_names(:one)
  end

  test "should get index" do
    get person_names_url
    assert_response :success
  end

  test "should get new" do
    get new_person_name_url
    assert_response :success
  end

  test "should create person_name" do
    assert_difference('PersonName.count') do
      post person_names_url, params: { person_name: { changed_by: @person_name.changed_by, creator: @person_name.creator, date_changed: @person_name.date_changed, date_created: @person_name.date_created, date_voided: @person_name.date_voided, degree: @person_name.degree, family_name2: @person_name.family_name2, family_name: @person_name.family_name, family_name_prefix: @person_name.family_name_prefix, family_name_suffix: @person_name.family_name_suffix, given_name: @person_name.given_name, middle_name: @person_name.middle_name, person_id: @person_name.person_id, person_name_id: @person_name.person_name_id, preferred: @person_name.preferred, prefix: @person_name.prefix, uuid: @person_name.uuid, void_reason: @person_name.void_reason, voided: @person_name.voided, voided_by: @person_name.voided_by } }
    end

    assert_redirected_to person_name_url(PersonName.last)
  end

  test "should show person_name" do
    get person_name_url(@person_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_name_url(@person_name)
    assert_response :success
  end

  test "should update person_name" do
    patch person_name_url(@person_name), params: { person_name: { changed_by: @person_name.changed_by, creator: @person_name.creator, date_changed: @person_name.date_changed, date_created: @person_name.date_created, date_voided: @person_name.date_voided, degree: @person_name.degree, family_name2: @person_name.family_name2, family_name: @person_name.family_name, family_name_prefix: @person_name.family_name_prefix, family_name_suffix: @person_name.family_name_suffix, given_name: @person_name.given_name, middle_name: @person_name.middle_name, person_id: @person_name.person_id, person_name_id: @person_name.person_name_id, preferred: @person_name.preferred, prefix: @person_name.prefix, uuid: @person_name.uuid, void_reason: @person_name.void_reason, voided: @person_name.voided, voided_by: @person_name.voided_by } }
    assert_redirected_to person_name_url(@person_name)
  end

  test "should destroy person_name" do
    assert_difference('PersonName.count', -1) do
      delete person_name_url(@person_name)
    end

    assert_redirected_to person_names_url
  end
end
