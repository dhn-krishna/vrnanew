import React, { Component } from "react";
import { Button } from "primereact/button";

class UploadFormConfirmModule extends Component {
  render() {
    return (
      <div className="p-col-12 p-text-right">
      <Button
        className="upload-poster-btn p-button-success p-m-1"
        label="Submit"
        icon="pi pi-times"
        type="submit"
        onClick={() => console.log(this.state)}
      />
    </div>
    );
  }
}
export default UploadFormConfirmModule;
