import React from 'react';
import PropTypes from 'prop-types';

export default class ExpenseReport extends React.Component {
	static propTypes = {
		tripNum: PropTypes.number,
		formNum: PropTypes.number,
		departDate: PropTypes.string,
		returnDate: PropTypes.string,
		destination: PropTypes.string,
		purpose: PropTypes.string,
		status: PropTypes.string,
		created_at: PropTypes.string,
		updated_at: PropTypes.string,
	}

	render = () => {
		return(
			<tr>
				<td>{this.props.expense_report.tripNum}</td>
				<td>{this.props.expense_report.formNum}</td>
				<td>{this.props.expense_report.departDate}</td>
				<td>{this.props.expense_report.returnDate}</td>
				<td>{this.props.expense_report.destination}</td>
				<td>{this.props.expense_report.purpose}</td>
				<td>{this.props.expense_report.status}</td>
				<td>{this.props.expense_report.created_at}</td>
				<td>{this.props.expense_report.updated_at}</td>
			</tr>
			)
	};
}