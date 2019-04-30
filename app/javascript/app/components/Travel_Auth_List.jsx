import React from 'react';
import Travel_Auth from './Travel_Auth';
import { Link } from 'react-router-dom';

export default class Travel_Auth_List extends React.Component {
	render = () => {
		var travel_auths = [];

		this.props.travel_auths.forEach(function(travel_auth) {
			travel_auths.push(
				<Travel_Auth travel_auth={travel_auth}
				key={'travel_auth' + travel_auth.id}/>);
		});

		return(
			<div>
				<br/>
				<h1>Travel Authorizations</h1>
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
						{travel_auths}
					</tbody>
				</table>
				<Link to="/travel_authorizations/new">New Travel Authorization</Link>
			</div>
		)
	};
}