import React, { Component } from "react";
import "./Profile.scss";
import { Divider } from "primereact/divider";
import {InputText} from 'primereact/inputtext';
class ProfileModule extends Component {
  render() {
    return (
      <div className="ProfileModule">
        <h2 className="p-pl-2">Profile</h2>
        <Divider />
        <div className="p-fluid p-shadow-2 bg-w p-p-3">
          <div className="p-field">
            <label htmlFor="firstname1">Firstname</label>
            <InputText id="firstname1" type="text" />
          </div>
          <div className="p-field">
            <label htmlFor="lastname1">Lastname</label>
            <InputText id="lastname1" type="text" />
          </div>
        </div>
      </div>
    );
  }
}
export default ProfileModule;
