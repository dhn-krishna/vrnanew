import React, { Component } from "react";
import "./Feedback.scss";
import { Divider } from "primereact/divider";

class FeedbackModule extends Component {
  render() {
    return (
      <div className="FeedbackModule">
        <h2 className="p-pl-2">Send Feedback</h2>
        <Divider />
      </div>
    );
  }
}
export default FeedbackModule;
