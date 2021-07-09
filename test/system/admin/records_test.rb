require "application_system_test_case"

class Admin::RecordsTest < ApplicationSystemTestCase
  setup do
    @admin_record = admin_records(:one)
  end

  test "visiting the index" do
    visit admin_records_url
    assert_selector "h1", text: "Admin/Records"
  end

  test "creating a Record" do
    visit admin_records_url
    click_on "New Admin/Record"

    fill_in "Ip string", with: @admin_record.ip_string
    fill_in "Useragent", with: @admin_record.useragent
    click_on "Create Record"

    assert_text "Record was successfully created"
    click_on "Back"
  end

  test "updating a Record" do
    visit admin_records_url
    click_on "Edit", match: :first

    fill_in "Ip string", with: @admin_record.ip_string
    fill_in "Useragent", with: @admin_record.useragent
    click_on "Update Record"

    assert_text "Record was successfully updated"
    click_on "Back"
  end

  test "destroying a Record" do
    visit admin_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Record was successfully destroyed"
  end
end
