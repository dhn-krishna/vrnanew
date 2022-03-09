import React, { Component } from "react";
import "./Upload.scss";
import { Button } from "primereact/button";

import posterPlaceholder from "../../../assets/images/poster-placeholder.jpg";

class UploadModule extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  preview_image = (event) => {
    console.log(event);
    var reader = new FileReader();
    reader.onload = function () {
      var output = document.getElementById("output_image");
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };

  render() {
    return (
      <div className="UploadModule">
        <div className="p-grid nested-grid p-m-1">
          <div className="p-sm-4 p-md-4 p-lg-3">
            <div className="p-d-flex p-flex-column">
              <img
                className="p-shadow-3 poster-img"
                src="/demo/img/premam-poster.jpg"
                onError={(e) => (e.target.src = posterPlaceholder)}
                alt="poster"
              />

              <div className="upload-action-area p-mt-2 p-text-center">
                <Button
                  className="upload-poster-btn p-button-danger p-m-1"
                  label="Clear"
                  icon="pi pi-times"
                />
                <Button
                  className="upload-poster-btn p-m-1"
                  label="Upload"
                  icon="pi pi-upload"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
export default UploadModule;
