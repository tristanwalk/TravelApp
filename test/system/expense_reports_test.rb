require "application_system_test_case"

class ExpenseReportsTest < ApplicationSystemTestCase
  setup do
    @expense_report = expense_reports(:one)
  end

  test "visiting the index" do
    visit expense_reports_url
    assert_selector "h1", text: "Expense Reports"
  end

  test "creating a Expense report" do
    visit expense_reports_url
    click_on "New Expense Report"

    fill_in " reciepts", with: @expense_report. reciepts
    fill_in "Deptdate", with: @expense_report.deptDate
    fill_in "Deptnum", with: @expense_report.deptNum
    fill_in "Destination", with: @expense_report.destination
    fill_in "Empid", with: @expense_report.empID
    fill_in "Expenses", with: @expense_report.expenses
    fill_in "Firstname", with: @expense_report.firstName
    fill_in "Formnum", with: @expense_report.formNum
    fill_in "Lastname", with: @expense_report.lastName
    fill_in "Purpose", with: @expense_report.purpose
    fill_in "Sources", with: @expense_report.sources
    fill_in "Status", with: @expense_report.status
    fill_in "Submissiontime", with: @expense_report.submissionTime
    fill_in "Tripnum", with: @expense_report.tripNum
    fill_in "Updatetime", with: @expense_report.updateTime
    click_on "Create Expense report"

    assert_text "Expense report was successfully created"
    click_on "Back"
  end

  test "updating a Expense report" do
    visit expense_reports_url
    click_on "Edit", match: :first

    fill_in " reciepts", with: @expense_report. reciepts
    fill_in "Deptdate", with: @expense_report.deptDate
    fill_in "Deptnum", with: @expense_report.deptNum
    fill_in "Destination", with: @expense_report.destination
    fill_in "Empid", with: @expense_report.empID
    fill_in "Expenses", with: @expense_report.expenses
    fill_in "Firstname", with: @expense_report.firstName
    fill_in "Formnum", with: @expense_report.formNum
    fill_in "Lastname", with: @expense_report.lastName
    fill_in "Purpose", with: @expense_report.purpose
    fill_in "Sources", with: @expense_report.sources
    fill_in "Status", with: @expense_report.status
    fill_in "Submissiontime", with: @expense_report.submissionTime
    fill_in "Tripnum", with: @expense_report.tripNum
    fill_in "Updatetime", with: @expense_report.updateTime
    click_on "Update Expense report"

    assert_text "Expense report was successfully updated"
    click_on "Back"
  end

  test "destroying a Expense report" do
    visit expense_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expense report was successfully destroyed"
  end
end
