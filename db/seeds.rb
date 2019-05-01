# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TravelAuthorization.delete_all
PaymentManager.delete_all
Employee.delete_all
ExpenseReport.delete_all
BudgetApprover.delete_all
Account.delete_all
Department.delete_all
Expense.delete_all
Source.delete_all

Employee.create!(firstName: 'Emily', lastName: 'Emily', email: 'emily@test.com', empID: '1', deptNum: '1')
Employee.create!(firstName: 'Eric', lastName: 'Eric',email: 'jon@example.com', empID: '2', deptNum: '2')

BudgetApprover.create!(firstName: 'Bob', lastName: 'Bob', email: 'bob@test.com',
	empID: '3', deptNum: '1')
BudgetApprover.create!(firstName: 'Bric', lastName: 'Bric', email: 'bric@test.com',
	empID: '4', deptNum: '2')

PaymentManager.create!(firstName: 'Paul', lastName: 'Paul', email: 'paul@test.com',
	empID: '5', deptNum: '1')

Account.create!(firstName: 'Emily', lastName: 'Emily', empID: '1', deptNum: '1', email: 'emily@test.com',
	password:'test12', :accountable => Employee.find_by(firstName: "Emily"))
Account.create!(firstName: 'Eric', lastName: 'Eric', empID: '2', deptNum: '2', email: 'eric@test.com',
	password:'test12', :accountable => Employee.find_by(firstName: "Eric"), accountable_id: '2')
Account.create!(firstName: 'Bob', lastName: 'Bob', empID: '3', deptNum: '1', email: 'bob@test.com',
	password:'test12', :accountable => BudgetApprover.find_by(firstName: "Bob"))
Account.create!(firstName: 'Bric', lastName: 'Bric', empID: '4', deptNum: '2', email: 'bric@test.com',
	password:'test12', :accountable => BudgetApprover.find_by(firstName: "Bric"))
Account.create!(firstName: 'Paul', lastName: 'Paul', empID: '5', deptNum: '1', email: 'paul@test.com',
	password:'test12', :accountable => PaymentManager.find_by(firstName: "Paul"))

Department.create!(currentBudget: '1000', totalBudget: '1000', name: 'CS', deptNum: '1')
Department.create!(currentBudget: '500', totalBudget: '1000', name: 'CIS', deptNum: '2')

TravelAuthorization.create!(firstName: 'Emily', lastName: 'Emily',empID: '1',
 tripNum: '1', deptNum: '1', formNum: '1', departDate: 'DateTime.parse("25/04/2020")',
 returnDate: 'DateTime.parse("30/04/2020")', destination: 'Atlanta', purpose: 'Meeting', 
 status: 'Pending')
TravelAuthorization.create!(firstName: 'Eric', lastName: 'Eric',empID: '2',
 tripNum: '2', deptNum: '2', formNum: '2', departDate: 'DateTime.parse("06/04/2020")',
 returnDate: 'DateTime.parse("10/04/2020")', destination: 'NewYork', purpose: 'Conference', 
 status: 'Pending')

ExpenseReport.create!(tripNum: '1', firstName: 'Emily', lastName: 'Emily',
	empID: '1', deptNum: '1', formNum: '1', departDate: 'DateTime.parse("25/04/2020")',
	returnDate: 'DateTime.parse("30/04/2020")', destination: 'Atlanta',
	purpose: 'Meeting', status: 'Pending')
ExpenseReport.create!(tripNum: '2', firstName: 'Eric', lastName: 'Eric',
	empID: '2', deptNum: '2', formNum: '2', departDate: 'DateTime.parse("06/04/2020")',
	returnDate: 'DateTime.parse("10/04/2020")', destination: 'NewYork',
	purpose: 'Conference', status: 'Pending')

Expense.create!(expenseName: 'Meal', expectedAmount: '200', actualAmount: '150', approval: 'Pending',
	travel_authorization_id: '1', expense_report_id: '1')
Expense.create!(expenseName: 'Rent', expectedAmount: '250', actualAmount: '200', approval: 'Pending',
	travel_authorization_id: '1', expense_report_id: '1')
Expense.create!(expenseName: 'Hotel', expectedAmount: '300', actualAmount: '300', approval: 'Pending',
	travel_authorization_id: '2', expense_report_id: '2')
Expense.create!(expenseName: 'Airfare', expectedAmount: '350', actualAmount: '250', approval: 'Pending',
	travel_authorization_id: '2', expense_report_id: '2')

Source.create!(department: '1', amount: '150', approval: 'Pending', travel_authorization_id: '1', expense_report_id: '1',
	expense_id: '1')
Source.create!(department: '2', amount: '50', approval: 'Pending', travel_authorization_id: '1', expense_report_id: '1',
	expense_id: '1')

Source.create!(department: '1', amount: '50', approval: 'Pending', travel_authorization_id: '1', expense_report_id: '1',
	expense_id: '2')
Source.create!(department: '2', amount: '200', approval: 'Pending', travel_authorization_id: '1', expense_report_id: '1',
	expense_id: '2')

Source.create!(department: '1', amount: '100', approval: 'Pending', travel_authorization_id: '2', expense_report_id: '2',
	expense_id: '3')
Source.create!(department: '2', amount: '200', approval: 'Pending', travel_authorization_id: '2', expense_report_id: '2',
	expense_id: '3')

Source.create!(department: '1', amount: '150', approval: 'Pending', travel_authorization_id: '2', expense_report_id: '2',
	expense_id: '4')
Source.create!(department: '2', amount: '200', approval: 'Pending', travel_authorization_id: '2', expense_report_id: '2',
	expense_id: '4')