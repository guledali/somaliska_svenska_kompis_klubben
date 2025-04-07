require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
    assert_select "h2", "Upcoming Events"
    assert_select ".card-title", /Future Event/
  end

  test "should display upcoming events" do
    get root_url
    assert_response :success

    # Check that future events are displayed
    assert_select ".card-body h3", /Future Event/

    # Check that past events are not displayed in the upcoming events section
    assert_select ".card-body h3", { count: 0, text: /Past Event/ }
  end
end
