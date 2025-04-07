require "application_system_test_case"

class GallerySectionTest < ApplicationSystemTestCase
  fixtures :galleries

  test "visiting the home page shows gallery section" do
    visit root_path

    assert_selector "h2", text: "Gallery"

    within("#gallery") do
      assert_selector ".card", count: Gallery.count

      community = galleries(:community)
      assert_selector "img[src='#{community.image_url}']"
      assert_selector "img[alt='#{community.title}']"

      cultural = galleries(:cultural)
      assert_selector "img[src='#{cultural.image_url}']"
      assert_selector "img[alt='#{cultural.title}']"
    end
  end
end
