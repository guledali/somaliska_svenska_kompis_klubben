require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  test "should not save activity without title" do
    activity = Activity.new(description: "Test description", schedule: "Test schedule")
    assert_not activity.save, "Saved the activity without a title"
  end

  test "should not save activity without description" do
    activity = Activity.new(title: "Test title", schedule: "Test schedule")
    assert_not activity.save, "Saved the activity without a description"
  end

  test "should not save activity without schedule" do
    activity = Activity.new(title: "Test title", description: "Test description")
    assert_not activity.save, "Saved the activity without a schedule"
  end

  test "should save valid activity" do
    activity = Activity.new(
      title: "Test Activity",
      description: "This is a test activity",
      schedule: "Mondays 3-5 PM",
      icon: "bi bi-star",
      image: "https://example.com/image.jpg"
    )
    assert activity.save, "Could not save a valid activity"
  end

  test "should generate slug from title" do
    activity = Activity.new(
      title: "Awesome Test Activity",
      description: "This is a test activity",
      schedule: "Mondays 3-5 PM"
    )
    activity.save
    assert_equal "awesome-test-activity", activity.slug, "Slug was not generated correctly from title"
  end

  test "to_param should return slug" do
    activity = activities(:kids_learning)
    assert_equal activity.slug, activity.to_param, "to_param did not return the slug"
  end

  test "slug should handle special characters" do
    activity = Activity.new(
      title: "Activity with & special! characters?",
      description: "This is a test activity",
      schedule: "Mondays 3-5 PM"
    )
    activity.save
    assert_equal "activity-with-special-characters", activity.slug, "Slug did not handle special characters correctly"
  end

  test "slug should be unique" do
    existing = activities(:kids_learning)
    duplicate = Activity.new(
      title: "Kids' Learning",  # Same title as existing fixture
      description: "Another description",
      schedule: "Another schedule"
    )

    # Save should still work as it should generate a unique slug
    assert duplicate.save, "Could not save activity with duplicate title"
    # But the slug should have been made unique
    assert_not_equal existing.slug, duplicate.slug, "Duplicate activity was given the same slug"
  end
end
