require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_contact_params = {
      contact: {
        name: "Test User",
        email: "test@example.com",
        message: "This is a test message"
      }
    }

    @invalid_contact_params = {
      contact: {
        name: "",
        email: "invalid-email",
        message: ""
      }
    }
  end

  test "should create contact with valid params" do
    assert_difference("Contact.count") do
      post contacts_path, params: @valid_contact_params
    end

    assert_redirected_to root_path
    assert_equal "Your message was sent successfully!", flash[:notice]
  end

  test "should not create contact with invalid params" do
    assert_no_difference("Contact.count") do
      post contacts_path, params: @invalid_contact_params
    end

    assert_redirected_to root_path
    assert_not_nil flash[:alert]
    assert flash[:alert].include?("Error:")
  end

  test "should handle JSON format for valid params" do
    assert_difference("Contact.count") do
      post contacts_path, params: @valid_contact_params, as: :json
    end

    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal "Message sent successfully", json_response["message"]
  end

  test "should handle JSON format for invalid params" do
    assert_no_difference("Contact.count") do
      post contacts_path, params: @invalid_contact_params, as: :json
    end

    assert_response :unprocessable_entity
    json_response = JSON.parse(response.body)
    assert_not_nil json_response["name"]
    assert_not_nil json_response["email"]
    assert_not_nil json_response["message"]
  end
end
