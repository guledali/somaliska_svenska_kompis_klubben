require "application_system_test_case"

class ContactSectionTest < ApplicationSystemTestCase
  test "displays contact form on home page" do
    visit root_url

    within("section#get-involved") do
      assert_selector "h2", text: "Get Involved"
      assert_selector "form"
      assert_selector "label", text: "Name"
      assert_selector "label", text: "Email"
      assert_selector "label", text: "Message"
      assert_selector "input[type=submit][value='Send Message']"
    end
  end

  test "displays contact information" do
    visit root_url

    within("section#get-involved") do
      assert_selector "svg.bi-envelope"
      assert_selector "a[href='mailto:contact@communityhub.com']", text: "contact@communityhub.com"
      assert_selector "svg.bi-telephone"
      assert_text "(555) 123-4567"
    end
  end
end
