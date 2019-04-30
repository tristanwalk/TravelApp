import React from "react";
import axios from "axios";
import Expense from './Expense';
import { Link } from 'react-router-dom';

export default class TravelAuthorizationForm extends React.Component {

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
      expenses_attributes: [{expenseName: "", expectedAmount: ""}],
      sources_attributes: [{id: "", department: "", amount: ""}],
      errors: {}
    };
    this.onFormSubmit = this.onFormSubmit.bind(this);
    this.handleExpenseChange = this.handleExpenseChange.bind(this);
    this.handleSourceChange = this.handleSourceChange.bind(this);
  }

  onFormSubmit(event) {
    event.preventDefault();

    const newTravelAuthorization = {
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
      expenses_attributes: this.state.expenses_attributes,
      sources_attributes: this.state.sources_attributes
    };
    console.log(this.state.firstName);

    var self = this;
    axios.defaults.headers.common['Content-Type'] = 'multipart/form-data';
    axios
      .post("/travel_authorizations", {...newTravelAuthorization })
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

    addExpense(){
        this.setState(prevState => ({ 
            expenses_attributes: [...prevState.expenses_attributes, { expenseName: "", expectedAmount: ""}]
        }))
  }

    addSource(){
        this.setState(prevState => ({ 
            sources_attrubutes: [...prevState.sources_attributes, { id: "", department: "", amount: "" }]
        }))
  }

    removeExpense(i){
     let expenses_attributes = [...this.state.expenses_attributes];
     expenses_attributes.splice(i, 1);
     this.setState({ expenses_attributes });
  }

    removeSource(i){
     let sources_attributes = [...this.state.sources_attributes];
     sources_attributes.splice(i, 1);
     this.setState({ sources_attributes });
  }


  createExpense(){
     return this.state.expenses_attributes.map((el, i) => (
       <div key={i}>
            <input type="text" className="form-control form-control-lg" placeholder="Expense Name" name="expenseName" value={el.expenseName ||''} onChange={this.handleExpenseChange.bind(this, i)} />
            <input type="number" className="form-control form-control-lg" placeholder="Expected Amount" name="expectedAmount" value={el.expectedAmount ||''} onChange={this.handleExpenseChange.bind(this, i)} />
            <input type='button' value='remove' onClick={this.removeExpense.bind(this, i)}/>
            <div className="form-group">
                      <div className="row">
                        <div>
                          {this.createSource().bind(this, i)} 
                          <input type='button' value='add source' onClick={this.addSource.bind(this)}/>
                        </div>
                      </div>
                    </div>
       </div>          
     ))
  }

createSource(el, i){
     return this.sources_attributes.map((ek, i) => (
       <div key={i}>
            <input type="number" className="form-control form-control-lg" placeholder="Source Name" name="departments" value={ek.department ||''} onChange={this.handleSourcehange.bind(this, i)} />
            <input type="number" className="form-control form-control-lg" placeholder="Amount" name="amount" value={ek.amount ||''} onChange={this.handleSourceChange.bind(this, i)} />
            <input type='button' value='remove' onClick={this.removeSource.bind(this, i)}/>
       </div>          
     ))
  }

    handleExpenseChange(i, e) {
    console.log(e.target);
     const { name, value } = e.target;
     let expenses_attributes = [...this.state.expenses_attributes];
     console.log(expenses_attributes);
     expenses_attributes[i] = {...expenses_attributes[i], [name]: value};
     console.log(expenses_attributes);
     this.setState({ expenses_attributes });
  }

    handleSourceChange(i, e) {
    console.log(e.target);
     const { name, value } = e.target;
     let sources_attributes = [...this.state.sources_attributes];
     console.log(sources_attributes);
     sources_attributes[i] = {...sources_attributes[i], [name]: value};
     console.log(sources_attributes);
     this.setState({ sources_attributes });
  }

  handleSelectStatus = selected_status_type => {
    console.log(selected_status_type);
    var travel_source  = {...this.state.source}
    travel_source.approval = selected_status_type;
    this.setState({travel_source})
  }

  render = () => {
    const { errors } = this.state;
    console.log(errors)
    return (
        <div>   
			<h2>Please Enter Your Details</h2>
                <form noValidate onSubmit={this.onFormSubmit}>

                    <div className="form-group">
                        <input
                            type="text"
                            className="form-control form-control-lg"
                            placeholder="First Name"
                            name="firstName"
                            onChange={e => this.setState({ firstName: e.target.value })}

                            />
                            {/*value={this.state.firstName}*/}
                    </div>
                    <div className="form-group">
                        <input
                            type="text"
                            className="form-control form-control-lg"
                            placeholder="Last Name"
                            name="lastName"
                            onChange={e => this.setState({ lastName: e.target.value })}
/>
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
                            {
                                this.state.expenses_attributes.map((el, i) => {
                                return(
                                   <div key={i}>
                                        <input type="text" className="form-control form-control-lg" placeholder="Expense Name" name="expenseName" value={el.expenseName ||''} onChange={this.handleExpenseChange.bind(this, i)} />
                                        <input type="number" className="form-control form-control-lg" placeholder="Expected Amount" name="expectedAmount" value={el.expectedAmount ||''} onChange={this.handleExpenseChange.bind(this, i)} />
                                        <input type='button' value='remove' onClick={this.removeExpense.bind(this, i)}/>
                                        <div className="form-group">
                                          <div className="row">
                                            <div>
                                                {this.state.sources_attributes.map((el, i) => {
                                                    return (
                                                       <div key={i}>
                                                            <input type="number" className="form-control form-control-lg" placeholder="Source Name" name="department" value={el.department ||''} onChange={this.handleSourceChange.bind(this, i)} />
                                                            <input type="number" className="form-control form-control-lg" placeholder="Amount" name="amount" value={el.amount ||''} onChange={this.handleSourceChange.bind(this, i)} />
                                                            <input type='button' value='remove' onClick={this.removeSource.bind(this, i)}/>
                                                          </div>  
                                                       )
                                              })} 
                                              <input type='button' value='add source' onClick={this.addSource.bind(this)}/>
                                            </div>
                                          </div>
                                                </div>
                                   </div>
                                   )
                                    })
                            }
                          <input type='button' value='add expense' onClick={this.addExpense.bind(this)}/>
                        </div>
                      </div>
                    </div>

                    <div className="actions" align="right">
                        <input
                            type="submit"
                            className="btn btn-success"
                        />
                        &nbsp;
                        <Link className="btn btn-success" to="/">
                            Cancel
                        </Link>
                    </div>
                </form>
            </div>
);
};
}


