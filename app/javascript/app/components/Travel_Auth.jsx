import React from 'react';
import PropTypes from 'prop-types';

export default class Travel_Auth extends React.Component {
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
				<td>{this.props.travel_auth.tripNum}</td>
				<td>{this.props.travel_auth.formNum}</td>
				<td>{this.props.travel_auth.departDate}</td>
				<td>{this.props.travel_auth.returnDate}</td>
				<td>{this.props.travel_auth.destination}</td>
				<td>{this.props.travel_auth.purpose}</td>
				<td>{this.props.travel_auth.status}</td>
				<td>{this.props.travel_auth.created_at}</td>
				<td>{this.props.travel_auth.updated_at}</td>
			</tr>
			)
	};
}