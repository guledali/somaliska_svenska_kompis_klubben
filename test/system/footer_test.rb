require "application_system_test_case"

class FooterTest < ApplicationSystemTestCase
  test "visiting the home page shows gallery section" do
    visit root_path

    within("footer") do
      assert_text "sskk i sundsvalls kommun"
    end
  end
end
