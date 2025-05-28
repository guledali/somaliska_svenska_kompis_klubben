require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(
      name: "Test User",
      email_address: "test@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
  end

  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should create session with valid credentials" do
    post session_url, params: {
      email_address: @user.email_address,
      password: "password123"
    }
    assert_redirected_to admin_url # should redirect to admin page after successful login
    assert_not_nil cookies["session_id"]
  end

  test "should not create session with invalid credentials" do
    post session_url, params: {
      email_address: @user.email_address,
      password: "wrongpassword"
    }
    assert_redirected_to new_session_url
    assert_nil cookies["session_id"]
    assert_equal "Try another email address or password.", flash[:alert]
  end

  test "should destroy session" do
    post session_url, params: {
      email_address: @user.email_address,
      password: "password123"
    }
    assert_not_nil cookies["session_id"]

    delete session_url
    assert_redirected_to new_session_url
    assert_equal "", cookies["session_id"]
  end

  test "should rate limit login attempts" do
    11.times do
      post session_url, params: {
        email_address: @user.email_address,
        password: "wrongpassword"
      }
    end
    assert_redirected_to new_session_url
    assert_equal "Try another email address or password.", flash[:alert]
  end
end
