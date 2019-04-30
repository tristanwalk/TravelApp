import React from 'react';
import ExpenseReport from './ExpenseReport';
import { Link } from 'react-router-dom';


export default class ExpenseReportList extends React.Component {
	render = () => {
		var expense_reports = [];

		this.props.expense_reports.forEach(function(expense_report) {
			expense_reports.push(
				<ExpenseReport expense_report={expense_report}
				key={'expense_report' + expense_report.id}/>);
		});

		return(
			<div>
				<br/>
				<h1>Expense Reports</h1>
				<table>
					<thead>
						<tr>
					    	<th scope="col">Trip Number</th>
						    <th scope="col">Form Number</th>
						    <th scope="col">Departure Date</th>
						    <th scope="col">Return Date</th>
						    <th scope="col">Destination</th>
						    <th scope="col">Purpose</th>
						    <th scope="col">Status</th>
						    <th scope="col">Submission Time</th>
						    <th scope="col">Last Updated</th>
	    				</tr>
					</thead>
					<tbody>
						{expense_reports}
					</tbody>
				</table>
				<Link to="/expense_reports/new">New Expense Report</Link>
			</div>
		)
	};
}