  import React from 'react';
  import axios from "axios";
  import PropTypes from 'prop-types';
 
  export default class Source{
    render = () => {
      return(
				<div>
        <h5>Sources</h5>
            <form noValidate onSubmit={this.onFormSubmit}>
                <div className="form-group">
                    <input
                        type="source"
                        className= "form-control form-control-lg"
                        placeholder="Department Number of Source"
                        name="department"/>
                </div>
                <div className="form-group">
                    <input
                        type="number"
                        className="form-control form-control-lg"
                        placeholder="Amount"
                        name="amount"/>
                </div>
              <div className="actions" align="right">
                  <input
                    type="submit"
                    className="btn btn-success"
                   />
              </div>
           </form>
          </div>
        );
    };
  }
