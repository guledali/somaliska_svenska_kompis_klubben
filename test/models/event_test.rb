require "test_helper"

class EventTest < ActiveSupport::TestCase
  setup do
    @event = Event.new(
      title: "Test Event",
      description: "This is a test event",
      date: Date.tomorrow,
      location: "Test Location",
      capacity: 50
    )
  end

  test "should be valid with all attributes" do
    assert @event.valid?
  end

  test "should not be valid without a title" do
    @event.title = nil
    assert_not @event.valid?
    assert_includes @event.errors[:title], "can't be blank"
  end

  test "should not be valid without a description" do
    @event.description = nil
    assert_not @event.valid?
    assert_includes @event.errors[:description], "can't be blank"
  end

  test "should not be valid without a date" do
    @event.date = nil
    assert_not @event.valid?
    assert_includes @event.errors[:date], "can't be blank"
  end

  test "upcoming scope should return future events" do
    past_event = Event.create!(
      title: "Past Event",
      description: "This event has already happened",
      date: Date.yesterday,
      location: "Past Location",
      capacity: 50
    )

    future_event = Event.create!(
      title: "Future Event",
      description: "This event is coming up",
      date: Date.tomorrow,
      location: "Future Location",
      capacity: 50
    )

    upcoming_events = Event.upcoming

    assert_includes upcoming_events, future_event
    assert_not_includes upcoming_events, past_event
  end

  test "past scope should return past events" do
    past_event = Event.create!(
      title: "Past Event",
      description: "This event has already happened",
      date: Date.yesterday,
      location: "Past Location",
      capacity: 50
    )

    future_event = Event.create!(
      title: "Future Event",
      description: "This event is coming up",
      date: Date.tomorrow,
      location: "Future Location",
      capacity: 50
    )

    past_events = Event.past

    assert_includes past_events, past_event
    assert_not_includes past_events, future_event
  end

  test "upcoming events should be ordered by date (ascending)" do
    Event.destroy_all

    later_event = Event.create!(
      title: "Later Event",
      description: "This event happens later",
      date: Date.today + 3.days,
      location: "Later Location",
      capacity: 50
    )

    earlier_event = Event.create!(
      title: "Earlier Event",
      description: "This event happens earlier",
      date: Date.today + 1.day,
      location: "Earlier Location",
      capacity: 50
    )

    middle_event = Event.create!(
      title: "Middle Event",
      description: "This event happens in the middle",
      date: Date.today + 2.days,
      location: "Middle Location",
      capacity: 50
    )

    upcoming_events = Event.upcoming

    assert_equal [ earlier_event, middle_event, later_event ], upcoming_events.to_a
  end

  test "past events should be ordered by date (descending)" do
    Event.destroy_all

    oldest_event = Event.create!(
      title: "Oldest Event",
      description: "This event happened long ago",
      date: Date.today - 3.days,
      location: "Oldest Location",
      capacity: 50
    )

    newest_event = Event.create!(
      title: "Newest Event",
      description: "This event happened recently",
      date: Date.today - 1.day,
      location: "Newest Location",
      capacity: 50
    )

    middle_event = Event.create!(
      title: "Middle Event",
      description: "This event happened in between",
      date: Date.today - 2.days,
      location: "Middle Location",
      capacity: 50
    )

    past_events = Event.past

    assert_equal [ newest_event, middle_event, oldest_event ], past_events.to_a
  end

  test "events today should be included in upcoming events" do
    today_event = Event.create!(
      title: "Today's Event",
      description: "This event is happening today",
      date: Date.today,
      location: "Today Location",
      capacity: 50
    )

    upcoming_events = Event.upcoming

    assert_includes upcoming_events, today_event
  end

  test "should accept valid capacity" do
    @event.capacity = 0
    assert @event.valid?

    @event.capacity = 100
    assert @event.valid?

    @event.capacity = nil
    assert @event.valid?, "Capacity should be optional"
  end

  test "should accept valid location" do
    @event.location = nil
    assert @event.valid?, "Location should be optional"

    @event.location = ""
    assert @event.valid?, "Empty location should be valid"

    @event.location = "Virtual Event"
    assert @event.valid?
  end

  test "should have attendees" do
    # setup
    event = events(:future_event)

    # exercise
    attendee = event.attendees.first

    # verify
    assert attendee.name, "mike"
    assert attendee.email, "mike@example.com"
  end

  test "should destroy associated attendees if event is deleted" do
    # setup
    event = events(:future_event)
    attendee = event.attendees.first

    # exercise
    event.destroy

    # verify
    assert_not Attendee.exists?(id: attendee.id)
  end
end
