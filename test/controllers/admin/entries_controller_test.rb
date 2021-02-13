require "test_helper"

class Admin::EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_entry = admin_entries(:one)
  end

  test "should get index" do
    get admin_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_entry_url
    assert_response :success
  end

  test "should create admin_entry" do
    assert_difference('Admin::Entry.count') do
      post admin_entries_url, params: { admin_entry: { category_id: @admin_entry.category_id, content: @admin_entry.content, deleted_at: @admin_entry.deleted_at, desc: @admin_entry.desc, title: @admin_entry.title, user_id: @admin_entry.user_id } }
    end

    assert_redirected_to admin_entry_url(Admin::Entry.last)
  end

  test "should show admin_entry" do
    get admin_entry_url(@admin_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_entry_url(@admin_entry)
    assert_response :success
  end

  test "should update admin_entry" do
    patch admin_entry_url(@admin_entry), params: { admin_entry: { category_id: @admin_entry.category_id, content: @admin_entry.content, deleted_at: @admin_entry.deleted_at, desc: @admin_entry.desc, title: @admin_entry.title, user_id: @admin_entry.user_id } }
    assert_redirected_to admin_entry_url(@admin_entry)
  end

  test "should destroy admin_entry" do
    assert_difference('Admin::Entry.count', -1) do
      delete admin_entry_url(@admin_entry)
    end

    assert_redirected_to admin_entries_url
  end
end
