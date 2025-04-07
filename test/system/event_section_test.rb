require "application_system_test_case"

class EventSectionTest < ApplicationSystemTestCase
  fixtures :events

  test "events are displayed with correct title and description" do
    visit root_url

    # Get a future event from fixtures
    future_events = events(:future_event)

    # Check that the event title and description are displayed
    within("section#events") do
      assert_selector "h3", text: future_events.title
      assert_text future_events.description
    end
  end
end
