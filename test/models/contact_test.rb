require "test_helper"

class ContactTest < ActiveSupport::TestCase
  fixtures :contacts

  setup do
    @contact = contacts(:kids_learning_question)
  end

  test "valid contact with all attributes" do
    assert @contact.valid?, "Contact should be valid with all attributes"
  end

  test "invalid without name" do
    @contact.name = nil
    assert_not @contact.valid?, "Contact should be invalid without name"
    assert_includes @contact.errors[:name], "can't be blank"

    @contact.name = ""
    assert_not @contact.valid?, "Contact should be invalid with empty name"
  end

  test "invalid without email" do
    @contact.email = nil
    assert_not @contact.valid?, "Contact should be invalid without email"
    assert_includes @contact.errors[:email], "can't be blank"

    @contact.email = ""
    assert_not @contact.valid?, "Contact should be invalid with empty email"
  end

  test "invalid with improper email format" do
    invalid_emails = [ "test", "test@", "@example.com", "test@.com" ]

    invalid_emails.each do |invalid_email|
      @contact.email = invalid_email
      assert_not @contact.valid?, "Contact should be invalid with improper email: #{invalid_email}"
      assert_includes @contact.errors[:email], "is invalid"
    end
  end

  test "valid with proper email format" do
    valid_emails = [ "test@example.com", "test.user@example.co.uk", "test+label@example.com" ]

    valid_emails.each do |valid_email|
      @contact.email = valid_email
      assert @contact.valid?, "Contact should be valid with proper email: #{valid_email}"
    end
  end

  test "invalid without message" do
    @contact.message = nil
    assert_not @contact.valid?, "Contact should be invalid without message"
    assert_includes @contact.errors[:message], "can't be blank"

    @contact.message = ""
    assert_not @contact.valid?, "Contact should be invalid with empty message"
  end
end
