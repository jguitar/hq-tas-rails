require "application_system_test_case"

class BusinessUnitsTest < ApplicationSystemTestCase
  setup do
    @business_unit = business_units(:one)
  end

  test "visiting the index" do
    visit business_units_url
    assert_selector "h1", text: "Business Units"
  end

  test "creating a Business unit" do
    visit business_units_url
    click_on "New Business Unit"

    fill_in "Code", with: @business_unit.code
    fill_in "Name", with: @business_unit.name
    click_on "Create Business unit"

    assert_text "Business unit was successfully created"
    click_on "Back"
  end

  test "updating a Business unit" do
    visit business_units_url
    click_on "Edit", match: :first

    fill_in "Code", with: @business_unit.code
    fill_in "Name", with: @business_unit.name
    click_on "Update Business unit"

    assert_text "Business unit was successfully updated"
    click_on "Back"
  end

  test "destroying a Business unit" do
    visit business_units_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Business unit was successfully destroyed"
  end
end
