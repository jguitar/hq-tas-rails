require "application_system_test_case"

class WorkroomsTest < ApplicationSystemTestCase
  setup do
    @workroom = workrooms(:one)
  end

  test "visiting the index" do
    visit workrooms_url
    assert_selector "h1", text: "Workrooms"
  end

  test "creating a Workroom" do
    visit workrooms_url
    click_on "New Workroom"

    fill_in "Floor", with: @workroom.floor_id
    fill_in "Code", with: @workroom.code
    fill_in "Name", with: @workroom.name
    click_on "Create Workroom"

    assert_text "Workroom was successfully created"
    click_on "Back"
  end

  test "updating a Workroom" do
    visit workrooms_url
    click_on "Edit", match: :first

    fill_in "Floor", with: @workroom.floor_id
    fill_in "Code", with: @workroom.code
    fill_in "Name", with: @workroom.name
    click_on "Update Workroom"

    assert_text "Workroom was successfully updated"
    click_on "Back"
  end

  test "destroying a Workroom" do
    visit workrooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Workroom was successfully destroyed"
  end
end
