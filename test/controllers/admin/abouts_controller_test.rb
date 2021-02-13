require "test_helper"

class Admin::AboutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_about = admin_abouts(:one)
  end

  test "should get index" do
    get admin_abouts_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_about_url
    assert_response :success
  end

  test "should create admin_about" do
    assert_difference('Admin::About.count') do
      post admin_abouts_url, params: { admin_about: { about: @admin_about.about } }
    end

    assert_redirected_to admin_about_url(Admin::About.last)
  end

  test "should show admin_about" do
    get admin_about_url(@admin_about)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_about_url(@admin_about)
    assert_response :success
  end

  test "should update admin_about" do
    patch admin_about_url(@admin_about), params: { admin_about: { about: @admin_about.about } }
    assert_redirected_to admin_about_url(@admin_about)
  end

  test "should destroy admin_about" do
    assert_difference('Admin::About.count', -1) do
      delete admin_about_url(@admin_about)
    end

    assert_redirected_to admin_abouts_url
  end
end
