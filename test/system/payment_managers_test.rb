require "application_system_test_case"

class PaymentManagersTest < ApplicationSystemTestCase
  setup do
    @payment_manager = payment_managers(:one)
  end

  test "visiting the index" do
    visit payment_managers_url
    assert_selector "h1", text: "Payment Managers"
  end

  test "creating a Payment manager" do
    visit payment_managers_url
    click_on "New Payment Manager"

    fill_in "Email", with: @payment_manager.email
    fill_in "Empid", with: @payment_manager.empID
    fill_in "Firstname", with: @payment_manager.firstName
    fill_in "Forms", with: @payment_manager.forms
    fill_in "Lastname", with: @payment_manager.lastName
    fill_in "Password", with: @payment_manager.password
    fill_in "Username", with: @payment_manager.username
    click_on "Create Payment manager"

    assert_text "Payment manager was successfully created"
    click_on "Back"
  end

  test "updating a Payment manager" do
    visit payment_managers_url
    click_on "Edit", match: :first

    fill_in "Email", with: @payment_manager.email
    fill_in "Empid", with: @payment_manager.empID
    fill_in "Firstname", with: @payment_manager.firstName
    fill_in "Forms", with: @payment_manager.forms
    fill_in "Lastname", with: @payment_manager.lastName
    fill_in "Password", with: @payment_manager.password
    fill_in "Username", with: @payment_manager.username
    click_on "Update Payment manager"

    assert_text "Payment manager was successfully updated"
    click_on "Back"
  end

  test "destroying a Payment manager" do
    visit payment_managers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Payment manager was successfully destroyed"
  end
end
