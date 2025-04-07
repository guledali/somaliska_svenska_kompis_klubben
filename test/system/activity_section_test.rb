require "application_system_test_case"

class ActivitySectionTest < ApplicationSystemTestCase
  fixtures :activities

  test "visiting the homepage shows activities section" do
    visit root_path

    within("section#activities") do
      assert_selector "h2", text: "Our Activities"
      assert_selector ".card", count: Activity.count
    end

    # Test for kids learning activity using fixture data
    kids = activities(:kids_learning)

    assert_selector "h3", text: kids.title
    assert_text kids.description
    assert_text kids.schedule

    # Test for makeup workshop activity using fixture data
    makeup = activities(:makeup_workshop)

    assert_selector "h3", text: makeup.title
    assert_text makeup.description
    assert_text makeup.schedule
  end

  test "clicking Learn More navigates to activity page" do
    visit root_path

    activity = activities(:kids_learning)

    # Find the card containing the activity title
    button = find(".card", text: activity.title)

    button.click_link("Learn More")

    assert_current_path "/activities/#{activity.slug}"
  end
end
