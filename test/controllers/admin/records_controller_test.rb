require "test_helper"

class Admin::RecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_record = admin_records(:one)
  end

  test "should get index" do
    get admin_records_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_record_url
    assert_response :success
  end

  test "should create admin_record" do
    assert_difference('Admin::Record.count') do
      post admin_records_url, params: { admin_record: { ip_string: @admin_record.ip_string, useragent: @admin_record.useragent } }
    end

    assert_redirected_to admin_record_url(Admin::Record.last)
  end

  test "should show admin_record" do
    get admin_record_url(@admin_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_record_url(@admin_record)
    assert_response :success
  end

  test "should update admin_record" do
    patch admin_record_url(@admin_record), params: { admin_record: { ip_string: @admin_record.ip_string, useragent: @admin_record.useragent } }
    assert_redirected_to admin_record_url(@admin_record)
  end

  test "should destroy admin_record" do
    assert_difference('Admin::Record.count', -1) do
      delete admin_record_url(@admin_record)
    end

    assert_redirected_to admin_records_url
  end
end
