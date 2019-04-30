import React from 'react';
import axios from 'axios';
import ExpenseReportList from './ExpenseReportList';

export default class ExpenseReportPage extends React.Component {
	state = {
		expense_reports: []
		};

	componentDidMount = () => {
		var self = this;

		axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
		axios.get('/')
		.then(function (response) {
			console.log(response.data);
			self.setState({
				expense_reports: response.data.expense_reports			 })
		})
		.catch(function (error) {
			console.log(error);
		});
	};

	render = () => {
		return(
			<div className="container">
				<div className="row">
					<ExpenseReportList expense_reports={this.state.expense_reports}/>
				</div>
			</div>
		);
	};
}