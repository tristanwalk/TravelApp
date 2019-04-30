require "application_system_test_case"

class BudgetApproversTest < ApplicationSystemTestCase
  setup do
    @budget_approver = budget_approvers(:one)
  end

  test "visiting the index" do
    visit budget_approvers_url
    assert_selector "h1", text: "Budget Approvers"
  end

  test "creating a Budget approver" do
    visit budget_approvers_url
    click_on "New Budget Approver"

    fill_in "Deptnum", with: @budget_approver.deptNum
    fill_in "Email", with: @budget_approver.email
    fill_in "Empid", with: @budget_approver.empID
    fill_in "Firstname", with: @budget_approver.firstName
    fill_in "Forms", with: @budget_approver.forms
    fill_in "Lastname", with: @budget_approver.lastName
    fill_in "Password", with: @budget_approver.password
    fill_in "Username", with: @budget_approver.username
    click_on "Create Budget approver"

    assert_text "Budget approver was successfully created"
    click_on "Back"
  end

  test "updating a Budget approver" do
    visit budget_approvers_url
    click_on "Edit", match: :first

    fill_in "Deptnum", with: @budget_approver.deptNum
    fill_in "Email", with: @budget_approver.email
    fill_in "Empid", with: @budget_approver.empID
    fill_in "Firstname", with: @budget_approver.firstName
    fill_in "Forms", with: @budget_approver.forms
    fill_in "Lastname", with: @budget_approver.lastName
    fill_in "Password", with: @budget_approver.password
    fill_in "Username", with: @budget_approver.username
    click_on "Update Budget approver"

    assert_text "Budget approver was successfully updated"
    click_on "Back"
  end

  test "destroying a Budget approver" do
    visit budget_approvers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Budget approver was successfully destroyed"
  end
end
