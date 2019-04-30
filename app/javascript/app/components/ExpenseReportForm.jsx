	import React from "react";
  import axios from "axios";
  import Expense from './Expense';
  import { Link } from 'react-router-dom';
 
 
  export default class ExpenseReportForm extends React.Component {
 
    constructor(props) {
      super(props);
      this.state = {
        firstName: "",
        lastName: "",
        empID: "",
        tripNum: "",
        deptNum: "",
        formNum: "",
        departDate: "",
        returnDate: "",
        destination: "",
        purpose: "",
				status: "",
        errors: {}
      };
      this.onInputChange.bind(this);
      this.onFormSubmit = this.onFormSubmit.bind(this);
    }
 
    onFormSubmit(event) {
      event.preventDefault();
 
      const newExpenseReport = {
        firstName: this.state.firstName,
        lastName: this.state.lastName,
        empID: this.state.empID,
        tripNum: this.state.tripNum,
        deptNum: this.state.deptNum,
        formNum: this.state.formNum,
        departDate: this.state.departDate,
        returnDate: this.state.returnDate,
        destination: this.state.destination,
        purpose: this.state.purpose,
				status: this.state.status
      };
 
      var self = this;
      axios.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest";
      axios
        .post("/expense_reports", {...newExpenseReport })
        .then(function(response) {
          console.log(response.data);
          self.props.history.push({
            pathname: '/'
          });
        })
        .catch(function(error) {
          console.log(error.response);
          self.setState({errors: error.response.date})
        });
    }
 
    onInputChange(e) {
      this.setState({ [e.target.name]: e.target.value });
    }

    render() {
      return(
       <div>
        <h2>Please Enter Your Details</h2>
                  <form noValidate onSubmit={this.onFormSubmit}>
 
                      <div className="form-group">
                          <input
                              type="text"
                              className="form-control form-control-lg"
                              placeholder="First Name"
                              name="firstName"
                              onChange={e => this.setState({ firstName: e.target.value })}/>
                              {/*value={this.state.firstName}*/}
                      </div>
                      <div className="form-group">
                          <input
                              type="text"
                              className="form-control form-control-lg"
                              placeholder="Last Name"
                              name="lastName"
                              onChange={e => this.setState({ lastName: e.target.value })}/>
                              {/*value={this.state.lastName}*/}
                      </div>
                      <div className="form-group">
                          <input
                              type="number"
                              className="form-control form-control-lg"
                              placeholder="Employee ID"
                              name="empID"
                              onChange={e => this.setState({ empID: e.target.value })}/>
                              {/*value={this.state.empID}*/}
                      </div>
                     <div className="form-group">
                          <input
                              type="number"
                              className="form-control form-control-lg"
                              placeholder="Trip Number"
                              name="tripNum"
                              onChange={e => this.setState({ tripNum: e.target.value })}/>
                              {/*value={this.state.tripNum}*/}
                      </div>
                      <div className="form-group">
                          <input
                              type="number"
                              className="form-control form-control-lg"
                              placeholder="Department Number"
                              name="deptNum"
                              onChange={e => this.setState({ deptNum: e.target.value })}/>
                              {/*value={this.state.deptNum}*/}
                      </div>
                      <div className="form-group">
                          <input
                              type="number"
                              className="form-control form-control-lg"
                              placeholder="Form Num"
                              name="formNum"
                              onChange={e => this.setState({ formNum: e.target.value })}/>
                              {/*value={this.state.formNum}*/}
                       </div>
                       <div className="form-group">
                           <input
                               type="date"
                               className="form-control form-control-lg"
                               placeholder="Departure Date"
                             name="departDate"
                             onChange={e => this.setState({ departDate: e.target.value })}/>
                               {/*value={this.state.departDate}*/}
                       </div>
                       <div className="form-group">
                           <input
                               type="date"
                               className="form-control form-control-lg"
                               placeholder="Return Date"
                               name="returnDate"
                               onChange={e => this.setState({ returnDate: e.target.value })}/>
																{/*value={this.state.returnDate}*/}
                      </div>
                      <div className="form-group">
                          <input
                              type="text"
                              className="form-control form-control-lg"
                              placeholder="Destination"
                              name="destination"
                              onChange={e => this.setState({ destination: e.target.value })}/>
                              {/*value={this.state.destination}*/}
                      </div>
                      <div className="form-group">
                          <input
                              type="text"
                              className="form-control form-control-lg"
                              placeholder="Purpose"
                              name="purpose"
                              onChange={e => this.setState({ purpose: e.target.value })}/>
                              {/*value={this.state.purpose}*/}
                       </div>
                       <div className="form-group">
                         <div className="row">
                           <div>
                             {<Expense/>}
                           </div>
                         </div>
	                     </div>
												<div className="field">
													<label htmlFor="expense_status_type">Source Status</label>
                          <select id="expense_status" onChange={this.status}
                            name="expense[expense_status]" value={this.state.status}>
                              <option value="">Select a Status</option>
                              <option value="Pending">Pending</option>
                              <option value="Approved">Approved</option>
                              <option value="Denied">Denied</option>
                          </select>
                        <div className="actions" align="right">
                          <input
                              type="submit"
                              className="btn btn-success"
                       		/> 
												</div>
        </div>
        </form>
        </div>
												
      );
			
    }
}

