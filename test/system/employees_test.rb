require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "creating a Employee" do
    visit employees_url
    click_on "New Employee"

    fill_in "Deptnum", with: @employee.deptNum
    fill_in "Email", with: @employee.email
    fill_in "Empid", with: @employee.empID
    fill_in "Firstname", with: @employee.firstName
    fill_in "Forms", with: @employee.forms
    fill_in "Lastname", with: @employee.lastName
    fill_in "Password", with: @employee.password
    fill_in "Username", with: @employee.username
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "updating a Employee" do
    visit employees_url
    click_on "Edit", match: :first

    fill_in "Deptnum", with: @employee.deptNum
    fill_in "Email", with: @employee.email
    fill_in "Empid", with: @employee.empID
    fill_in "Firstname", with: @employee.firstName
    fill_in "Forms", with: @employee.forms
    fill_in "Lastname", with: @employee.lastName
    fill_in "Password", with: @employee.password
    fill_in "Username", with: @employee.username
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "destroying a Employee" do
    visit employees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employee was successfully destroyed"
  end
end
