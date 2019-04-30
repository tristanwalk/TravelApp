import React from 'react';
import PropTypes from 'prop-types';
import Source from './Source';
import axios from "axios";

export default class Expense {
 	   render = () => {
 	     return(
         <div>
            <h4>Expense</h4>
			<div className="form-group">
					<input
							type="text"
							className="form-control form-control-lg"
						  placeholder="Expense Name"
							name="expenseName"/>
			</div>
			<div className="form-group">
					<input
							type="number"
							className="form-control form-control-lg"
							placeholder="Expense Amount"
							name="expenseAmount"/>
			</div> 
         	<div className="form-group">
            	{<Source/>}
            </div>
         </div>
       );
     };
}
