require "application_system_test_case"

class ContributorsTest < ApplicationSystemTestCase
  setup do
    @contributor = contributors(:one)
  end

  test "visiting the index" do
    visit contributors_url
    assert_selector "h1", text: "Contributors"
  end

  test "creating a Contributor" do
    visit contributors_url
    click_on "New Contributor"

    fill_in "Site", with: @contributor.site_id
    fill_in "Business unit", with: @contributor.business_unit_id
    fill_in "Code", with: @contributor.code
    fill_in "First name", with: @contributor.first_name
    fill_in "Surname", with: @contributor.surname
    fill_in "Workplace", with: @contributor.workplace_id
    fill_in "Workroom", with: @contributor.workroom_id
    click_on "Create Contributor"

    assert_text "Contributor was successfully created"
    click_on "Back"
  end

  test "updating a Contributor" do
    visit contributors_url
    click_on "Edit", match: :first

    fill_in "Site", with: @contributor.site_id
    fill_in "Business unit", with: @contributor.business_unit_id
    fill_in "Code", with: @contributor.code
    fill_in "First name", with: @contributor.first_name
    fill_in "Surname", with: @contributor.surname
    fill_in "Workplace", with: @contributor.workplace_id
    fill_in "Workroom", with: @contributor.workroom_id
    click_on "Update Contributor"

    assert_text "Contributor was successfully updated"
    click_on "Back"
  end

  test "destroying a Contributor" do
    visit contributors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contributor was successfully destroyed"
  end
end
