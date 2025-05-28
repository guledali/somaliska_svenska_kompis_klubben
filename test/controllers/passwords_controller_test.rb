require "test_helper"

class PasswordsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(
      name: "Test User",
      email_address: "test@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
  end

  test "should get new" do
    get new_password_url
    assert_response :success
  end

  test "should create password reset for existing user" do
    assert_enqueued_with(job: ActionMailer::MailDeliveryJob) do
      post passwords_url, params: { email_address: @user.email_address }
    end
    assert_redirected_to new_session_url
    assert_equal "Password reset instructions sent (if user with that email address exists).", flash[:notice]
  end

  test "should not reveal if email exists" do
    post passwords_url, params: { email_address: "nonexistent@example.com" }
    assert_redirected_to new_session_url
    assert_equal "Password reset instructions sent (if user with that email address exists).", flash[:notice]
  end

  test "should not get edit with invalid token" do
    get edit_password_url("invalid_token")
    assert_redirected_to new_password_url
    assert_equal "Password reset link is invalid or has expired.", flash[:alert]
  end
end
