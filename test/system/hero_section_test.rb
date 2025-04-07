require_relative "../application_system_test_case"

class HeroSectionTest < ApplicationSystemTestCase
  test "visit the homepage" do
    visit root_url

    # Check header elements
    assert_selector "header.bg-primary"

    # Check main content
    assert_selector "h1", text: "Building Stronger Communities Together"
    assert_selector "p", text: /Join us in creating meaningful connections/

    # Check CTA button
    assert_selector "a.btn-primary", text: "Get Involved"

    # Test that the button is properly linked and visible when clicked
    click_on "Get Involved"
    assert page.current_url.include?("#activities")
  end
end
