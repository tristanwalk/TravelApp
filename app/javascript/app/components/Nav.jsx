import React from 'react';
import { Link } from 'react-router-dom';

export default class Nav extends React.Component{
	render = () => {
		return (
			<nav className="navbar navbar-expand-lg navbar-dark">
			    <div className="collapse navbar-collapse" id="navbarNavDropdown">
			        <ul className="navbar-nav">
						<li className="nav-item">
							<Link className="nav-link" to="/">Home</Link>
						</li>
						<li className="nav-item">
							<Link className="nav-link" to="/travel_authorizations">Travel Authorizations</Link>
						</li>
						<li className="nav-item">
							<Link className="nav-link" to="/expense_reports">Expense Reports</Link>
						</li>
						<li className="nav-item">
							<Link className="nav-link" to="/data/index">Data Analysis</Link>
						</li>
					  	<li className="nav-item">
					    	<Link className="nav-link" to="/accounts/sign_out">Sign Out</Link>
					  	</li>
			        </ul>
			    </div>
			</nav>
		);
	};
}