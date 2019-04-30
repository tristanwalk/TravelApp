# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TravelAuthorization.create!(firstName: 'Bob', lastName: 'Jim',empID: '1',
 tripNumber: '1', deptNumber: '1', formNumber: '1', departureDate: 'DateTime.parse("04/05/2019")',
 submissionTime: 'DateTime.parse("04/04/2019 15:00")', returnDate: 'DateTime.parse("04/13/2019")', 
 destination: 'Atlanta', purpose: 'Meeting', 
 expenses: 'Rental Vechicle and Meals', sources: 'NA', status: 'true')

TravelAuthorization.create!(firstName: 'Jon', lastName: 'Michael',empID: '2',
 tripNumber: '2', deptNumber: '2', formNumber: '2', departureDate: 'DateTime.parse("04/06/2019")',
 submissionTime: 'DateTime.parse("04/05/2019 13:00")', returnDate: 'DateTime.parse("04/15/2019")', 
 destination: 'NewYork', purpose: 'Conference', 
 expenses: 'Airfare, Meals and Other Transportation', sources: 'NA', status: 'false')

PaymentManager.create!(firstName: 'Teemo', lastName: 'Park', username: 'teemo1', 
	email: 'teemo@example.com', password: 'teemoEmail', forms: 'form1', empID: '3') 

PaymentManager.create!(firstName: 'Amy', lastName: 'Hong', username: 'amy1', 
	email: 'amy@example.com', password: 'amyEmail', forms: 'form2', empID: '4')

ExpenseReport.create!(reciepts:'NA', tripNum: '1', firstName: 'Bob', lastName: 'Jim',
	empID: '1', deptNum: '1', formNum: '1', 
	deptDate: 'DateTime.parse("04/05/2019")', submissionTime: 'DateTime.parse("04/04/2019 15:00")', 
	destination: 'Atlanta', purpose: 'Meeting', expenses:'Rental Vechicle and Meals', 
	sources: 'NA', status: 'true')

ExpenseReport.create!(reciepts:'NA', tripNum: '2', firstName: 'Jon', lastName: 'Michael',
	empID: '2', deptNum: '2', formNum: '2', 
	deptDate: 'DateTime.parse("04/06/2019")', submissionTime: 'DateTime.parse("04/05/2019 13:00")', 
	destination: 'NewYork', purpose: 'Conference', expenses:'Airfare, Meals and Other Transportation', 
	sources: 'NA', status: 'false')

Employee.create!(firstName: 'Bob', lastName: 'Jim', username: 'bob1',
	email: 'bob@example.com', password: 'bobEmail', forms: 'NA', empID: '1', deptNum: '1')

Employee.create!(firstName: 'Jon', lastName: 'Michael', username: 'jon1',
	email: 'jon@example.com', password: 'jonEmail', forms: 'NA', empID: '2', deptNum: '2')

BudgetApprover.create!(firstName: 'Bugun', lastName: 'Choi', username: 'skekrhrh', 
	email: 'bugun@example.com', password: 'bugunEmail', 
	forms: 'form1', empID: '5', deptNum: '5')

BudgetApprover.create!(firstName: 'Groot', lastName: 'Jay', username: 'groot1', 
	email: 'groot@example.com', password: 'grootEmail', 
	forms: 'form2', empID: '6', deptNum: '6')

TravelAuthorization.delete_all
PaymentManager.delete_all
Employee.delete_all
ExpenseReport.delete_all
BudgetApprover.delete_all
Account.delete_all

Employee.create!(firstName: 'Bob', lastName: 'Jim', email: 'bob@example.com', empID: '1', deptNum: '1')

Employee.create!(firstName: 'Jon', lastName: 'Michael', email: 'jon@example.com', empID: '2', deptNum: '2')

BudgetApprover.create!(firstName: 'Bugun', lastName: 'Choi', email: 'bugun@example.com', empID: '5', deptNum: '5')

BudgetApprover.create!(firstName: 'Groot', lastName: 'Jay', email: 'groot@example.com', empID: '6', deptNum: '6')

PaymentManager.create!(firstName: 'Amy', lastName: 'Hong', email: 'amy@example.com', empID: '4', deptNum: '0')

Account.create!( :firstName => 'Bob', :lastName => 'Jim', :empID => 1, :deptNum => 1, :email => 'bob@example.com', :password => 'bobEmail', :password_confirmation => 'bobEmail', 
                  :accountable => Employee.find_by(firstName: "Bob"))
Account.create!( :firstName => 'Jon', :lastName => 'Michael', :empID => 2, :deptNum => 2, :email => 'jon@example.com', :password => 'jonEmail', :password_confirmation => 'jonEmail', 
                  :accountable => Employee.find_by(firstName: "Jon"))
Account.create!( :firstName => 'Bugun', :lastName => 'Choi', :empID => 5, :deptNum => 5, :email => 'bugun@example.com', :password => 'bugunEmail', :password_confirmation => 'bugunEmail', 
                  :accountable => BudgetApprover.find_by(firstName: "Bugun"))
Account.create!( :firstName => 'Groot', :lastName => 'Jay', :empID => 6, :deptNum => 6, :email => 'groot@example.com', :password => 'grootEmail', :password_confirmation => 'grootEmail', 
                  :accountable => BudgetApprover.find_by(firstName: "Groot"))
Account.create!( :firstName => 'Amy', :lastName => 'Hong', :empID => 4, :deptNum => 0, :email => 'amy@example.com', :password => 'amyEmail', :password_confirmation => 'amyEmail', 
                  :accountable => PaymentManager.find_by(firstName: "Amy"))

TravelAuthorization.create!(firstName: 'Bob', lastName: 'Jim', empID: 1, tripNum: '1', deptNum: 1, formNum: '1', 
 departDate: 'DateTime.parse("04/05/2019")', returnDate: 'DateTime.parse("04/13/2019")', destination: 'Atlanta', 
 purpose: 'Meeting')

TravelAuthorization.create!(firstName: 'Jon', lastName: 'Michael', empID: '2', tripNum: '2', deptNum: '2', 
 formNum: '2', departDate: 'DateTime.parse("04/06/2019")', returnDate: 'DateTime.parse("04/15/2019")', 
 destination: 'New York', purpose: 'Conference')

ExpenseReport.create!(tripNum: '1', firstName: 'Bob', lastName: 'Jim', empID: '1', deptNum: '1', formNum: '3', 
	departDate: 'DateTime.parse("04/05/2019")', returnDate: 'DateTime.parse("04/13/2019")', 
	destination: 'Atlanta', purpose: 'Meeting')

ExpenseReport.create!(tripNum: '2', firstName: 'Jon', lastName: 'Michael', empID: '2', deptNum: '2', formNum: '4', 
	departDate: 'DateTime.parse("04/06/2019")', returnDate: 'DateTime.parse("04/15/2019")', 
	destination: 'NewYork', purpose: 'Conference')

