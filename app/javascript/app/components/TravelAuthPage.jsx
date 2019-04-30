import React from 'react';
import axios from 'axios';
import Travel_Auth_List from './Travel_Auth_List';

export default class TravelAuthPage extends React.Component {
	state = {
		travel_auths: []
		};

	componentDidMount = () => {
		var self = this;

		axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
		axios.get('/')
		.then(function (response) {
			console.log(response.data);
			self.setState({
				travel_auths: response.data.travel_authorizations			 })
		})
		.catch(function (error) {
			console.log(error);
		});
	};

	render = () => {
		return(
			<div className="container">
				<div className="row">
					<Travel_Auth_List travel_auths={this.state.travel_auths}/>
				</div>
			</div>
		);
	};
}