require "test_helper"

class AttendeeTest < ActiveSupport::TestCase
  test "should not create without name" do
    # setup
    attendee = Attendee.new(name: nil)

    # exercise
    attendee.save

    # verify
    assert attendee.errors.of_kind?(:name, :blank)
  end

  test "should not create event without email" do
    # setup
    attendee = Attendee.new(name: "John Doe", email: nil)

    # exercise
    attendee.save

    # verify
    assert attendee.errors.of_kind?(:email, :blank)
  end
end
