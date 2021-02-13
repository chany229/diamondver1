require "application_system_test_case"

class Admin::EntriesTest < ApplicationSystemTestCase
  setup do
    @admin_entry = admin_entries(:one)
  end

  test "visiting the index" do
    visit admin_entries_url
    assert_selector "h1", text: "Admin/Entries"
  end

  test "creating a Entry" do
    visit admin_entries_url
    click_on "New Admin/Entry"

    fill_in "Category", with: @admin_entry.category_id
    fill_in "Content", with: @admin_entry.content
    fill_in "Deleted at", with: @admin_entry.deleted_at
    fill_in "Desc", with: @admin_entry.desc
    fill_in "Title", with: @admin_entry.title
    fill_in "User", with: @admin_entry.user_id
    click_on "Create Entry"

    assert_text "Entry was successfully created"
    click_on "Back"
  end

  test "updating a Entry" do
    visit admin_entries_url
    click_on "Edit", match: :first

    fill_in "Category", with: @admin_entry.category_id
    fill_in "Content", with: @admin_entry.content
    fill_in "Deleted at", with: @admin_entry.deleted_at
    fill_in "Desc", with: @admin_entry.desc
    fill_in "Title", with: @admin_entry.title
    fill_in "User", with: @admin_entry.user_id
    click_on "Update Entry"

    assert_text "Entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Entry" do
    visit admin_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entry was successfully destroyed"
  end
end
