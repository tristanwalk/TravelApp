import React from 'react';
import axios from 'axios';
import Travel_Auth_List from './Travel_Auth_List';
import ExpenseReportList from './ExpenseReportList'

export default class Home extends React.Component {
	state = {
		travel_auths: [],
		expense_reports: []
	};

	componentDidMount = () => {
		var self = this;

		axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
		axios.get('/')
		.then(function (response) {
			console.log(response.data);
			self.setState({
				travel_auths: response.data.travel_authorizations,
				expense_reports: response.data.expense_reports
			 })
		})
		.catch(function (error) {
			console.log(error);
		});
	};

	render = () => {
		return(
			<div className="container">
				<div className="row">
					<h1>Home</h1>
					<Travel_Auth_List travel_auths={this.state.travel_auths}/>
					<ExpenseReportList expense_reports={this.state.expense_reports}/>
				</div>
			</div>
		);
	};
}