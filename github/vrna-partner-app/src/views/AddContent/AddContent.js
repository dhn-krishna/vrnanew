import React, { Component } from "react";
import "./AddContent.scss";
import { Steps } from "primereact/steps";
import UploadFormModule from "./UploadForm/UploadForm";
import UploadModule from "./Upload/Upload";
import UploadFormConfirmModule from "./UploadFormConfirm/UploadFormConfirm";
class AddContentModule extends Component {
  constructor(props) {
    super(props);
    this.state = {
      activeIndex: 0,
    };
    this.items = [
      {
        label: "Content Details",
        command: (event) => {
          console.log("Content Details");
        },
      },
      {
        label: "Media Upload",
        command: (event) => {
          console.log("Media Upload");
        },
      },
      {
        label: "Confirmation",
        command: (event) => {
          console.log("Confirmation");
        },
      },
    ];
  }

  onNext() {
    console.log("test");
    this.setState({ activeIndex: 2 });
  }

  render() {
    return (
      <div className="AddContent">
        <Steps
          model={this.items}
          activeIndex={this.state.activeIndex}
          onSelect={(e) => {
            this.setState({ activeIndex: e.index });
          }}
          readOnly={true}
        />
        <div
          className={this.state.activeIndex === 0 ? "activeTab" : "inActiveTab"}
        >
          <UploadFormModule onNext={this.onNext} />
        </div>
        <div
          className={this.state.activeIndex === 1 ? "activeTab" : "inActiveTab"}
        >
          <UploadModule />
        </div>
        <div
          className={this.state.activeIndex === 2 ? "activeTab" : "inActiveTab"}
        >
          <UploadFormConfirmModule />
        </div>
      </div>
    );
  }
}
export default AddContentModule;
