require 'test_helper'

class ExpenseReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expense_report = expense_reports(:one)
  end

  test "should get index" do
    get expense_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_expense_report_url
    assert_response :success
  end

  test "should create expense_report" do
    assert_difference('ExpenseReport.count') do
      post expense_reports_url, params: { expense_report: {  reciepts: @expense_report. reciepts, deptDate: @expense_report.deptDate, deptNum: @expense_report.deptNum, destination: @expense_report.destination, empID: @expense_report.empID, expenses: @expense_report.expenses, firstName: @expense_report.firstName, formNum: @expense_report.formNum, lastName: @expense_report.lastName, purpose: @expense_report.purpose, sources: @expense_report.sources, status: @expense_report.status, submissionTime: @expense_report.submissionTime, tripNum: @expense_report.tripNum, updateTime: @expense_report.updateTime } }
    end

    assert_redirected_to expense_report_url(ExpenseReport.last)
  end

  test "should show expense_report" do
    get expense_report_url(@expense_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_expense_report_url(@expense_report)
    assert_response :success
  end

  test "should update expense_report" do
    patch expense_report_url(@expense_report), params: { expense_report: {  reciepts: @expense_report. reciepts, deptDate: @expense_report.deptDate, deptNum: @expense_report.deptNum, destination: @expense_report.destination, empID: @expense_report.empID, expenses: @expense_report.expenses, firstName: @expense_report.firstName, formNum: @expense_report.formNum, lastName: @expense_report.lastName, purpose: @expense_report.purpose, sources: @expense_report.sources, status: @expense_report.status, submissionTime: @expense_report.submissionTime, tripNum: @expense_report.tripNum, updateTime: @expense_report.updateTime } }
    assert_redirected_to expense_report_url(@expense_report)
  end

  test "should destroy expense_report" do
    assert_difference('ExpenseReport.count', -1) do
      delete expense_report_url(@expense_report)
    end

    assert_redirected_to expense_reports_url
  end
end
