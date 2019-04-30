import React from 'react'

import NoStatusType          from './NoStatusType';
import PendingStatusType     from './PendingStatusType';
import ApprovedStatusType    from './ApprovedStatusType';
import DeniedStatusType      from './DeniedStatusType';


class SourceStatusSelector extends React.Component {
  constructor(props) {
    super(props);
    this.onSourceStatusSelected = this.onSourceStatusSelected.bind(this);
    this.state = { selectedStatusType: null };
  }

  onSourceStatusSelected(event) {
    this.setState({ selectedStatusType: event.target.value });
  }

  componentDidMount = () => {
    this.setState({ selectedStatusType: this.props.status_type ? this.props.status_type : ""});
  };

  render() {
    let SourceStatusCustomComponent = NoStatusType;
    if(this.state.selectedStatusType == "Pending") {
      SourceStatusCustomComponent = PendingStatusType;
    } else if (this.state.selectedStatusType == "Approved") {
      SourceStatusCustomComponent = ApprovedStatusType;
    } else if (this.state.selectedStatusType == "Denied") {
      SourceStatusCustomComponent = DeniedStatusType;
    }
    return (
      <div>
        <div className="field">
          <label htmlFor="source_status_type">Source Status</label>
          <select id="source_status" onChange={this.onSourceStatusSelected} 
            name="source[source_status]" value ={this.state.selectedStatusType}>
            <option value="">Select a Status</option>
            <option value="Pending">Pending</option>
            <option value="Approved">Approved</option>
            <option value="Denied">Denied</option>
          </select>
        </div>
        <SourceStatusCustomComponent />
      </div>
    );
  }
}
export default SourceStatusSelector
