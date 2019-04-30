import React from 'react';
import { Link, Switch } from 'react-router-dom';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Nav from './Nav';
import TravelAuthPage from './TravelAuthPage';
import ExpenseReportPage from './ExpenseReportPage';
import Home from './Home';
import TravelAuthorizationForm from './TravelAuthorizationForm';
import ExpenseReportForm from './ExpenseReportForm';

export default class App extends React.Component {
	render = () => {
		return (
			<div className="div">
				<Router>
					<div>
						<Nav/>
						<Switch>
							<Route exact path="/" component={Home} />
							<Route exact path="/travel_authorizations" component={TravelAuthPage} />
							<Route exact path="/expense_reports" component={ExpenseReportPage} />
							<Route exact path="/travel_authorizations/new" component={TravelAuthorizationForm} />
							<Route exact path="/expense_reports/new" component={ExpenseReportForm} />
						</Switch>
					</div>
				</Router>
			</div>
		);
	};
}