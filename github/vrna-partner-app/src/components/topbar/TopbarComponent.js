import React, { Component } from "react";
import "./TopbarComponent.scss";
import { Menubar } from "primereact/menubar";

import Logo from "../../assets/images/topbar-logo.png";
import { NavLink } from "react-router-dom";
import SearchApp from "./SearchApp/SearchApp";
import ProfileMenu from "./ProfileMenu/ProfileMenu";

class TopbarComponent extends Component {

  render() {
    const start = (
      <div className="VrnaLogo">
        <NavLink to="/admin" className="logo">
          <img alt="VRNA" src={Logo} />
        </NavLink>
      </div>
    );
    const rigtPanel = (
      <div className="p-d-flex">
        <SearchApp />
        <div className="p-ml-3 p-my-auto">
          <ProfileMenu />
        </div>
      </div>
    );
    return (
      <div className="TopbarComponent">
        <Menubar start={start} end={rigtPanel} />
      </div>
    );
  }
}
export default TopbarComponent;
