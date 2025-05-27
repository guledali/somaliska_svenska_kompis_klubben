require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: "Test User",
      email_address: "test@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be normalized" do
    @user.email_address = "TEST@EXAMPLE.COM"
    @user.save
    assert_equal "test@example.com", @user.reload.email_address
  end

  test "should authenticate with correct password" do
    @user.save
    assert User.authenticate_by(email_address: @user.email_address, password: "password123")
  end

  test "should not authenticate with incorrect password" do
    @user.save
    assert_not User.authenticate_by(email_address: @user.email_address, password: "wrongpassword")
  end

  test "should have many sessions" do
    assert_respond_to @user, :sessions
  end

  test "should destroy associated sessions when deleted" do
    @user.save
    @user.sessions.create!(user_agent: "Test Browser", ip_address: "127.0.0.1")
    assert_difference "Session.count", -1 do
      @user.destroy
    end
  end
end
