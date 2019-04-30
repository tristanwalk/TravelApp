require "application_system_test_case"

class TravelAuthorizationsTest < ApplicationSystemTestCase
  setup do
    @travel_authorization = travel_authorizations(:one)
  end

  test "visiting the index" do
    visit travel_authorizations_url
    assert_selector "h1", text: "Travel Authorizations"
  end

  test "creating a Travel authorization" do
    visit travel_authorizations_url
    click_on "New Travel Authorization"

    fill_in " ", with: @travel_authorization. 
    click_on "Create Travel authorization"

    assert_text "Travel authorization was successfully created"
    click_on "Back"
  end

  test "updating a Travel authorization" do
    visit travel_authorizations_url
    click_on "Edit", match: :first

    fill_in " ", with: @travel_authorization. 
    click_on "Update Travel authorization"

    assert_text "Travel authorization was successfully updated"
    click_on "Back"
  end

  test "destroying a Travel authorization" do
    visit travel_authorizations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Travel authorization was successfully destroyed"
  end
end
