require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = User.create!(
      name: "Admin User",
      email_address: "admin@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    @regular_user = User.create!(
      name: "Regular User",
      email_address: "user@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
  end

  test "should get index when authenticated as admin" do
    post session_url, params: {
      email_address: @admin.email_address,
      password: "password123"
    }
    get admin_url
    assert_response :success
  end

  test "should not get index when not authenticated" do
    get admin_url
    assert_redirected_to new_session_url
  end

  test "should not get index when authenticated as regular user" do
    post session_url, params: {
      email_address: @regular_user.email_address,
      password: "password123"
    }
    get admin_url
    assert_redirected_to root_url
    assert_equal "You must be an admin to access this page.", flash[:alert]
  end

  test "should show activities in admin dashboard" do
    post session_url, params: {
      email_address: @admin.email_address,
      password: "password123"
    }
    get admin_url
    assert_response :success
    assert_select "h2", "Activities"
  end

  test "should show events in admin dashboard" do
    post session_url, params: {
      email_address: @admin.email_address,
      password: "password123"
    }
    get admin_url
    assert_response :success
    assert_select "h2", "Events"
  end

  test "should show galleries in admin dashboard" do
    post session_url, params: {
      email_address: @admin.email_address,
      password: "password123"
    }
    get admin_url
    assert_response :success
    assert_select "h2", "Gallery"
  end
end
