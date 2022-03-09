import React, { Component } from "react";
import { NavLink } from "react-router-dom";
import "./SidebarComponent.scss";

class SidebarComponent extends Component {
  render() {
    return (
      <div className="SidebarComponent p-d-flex p-flex-column">
        <ul className="MainMenu">
          <li className="ParentMenu">
            <NavLink
              to="/admin/home"
              activeClassName="active"
              className="ParentLink p-d-flex p-flex-column"
            >
              <i className="pi pi-th-large"></i>
              <span className="ParentMenuLabel">DashBoard</span>
            </NavLink>
          </li>
          <li className="ParentMenu">
            <NavLink
              to="/admin/contents"
              activeClassName="active"
              className="ParentLink p-d-flex p-flex-column"
            >
              <i className="pi pi-video"></i>
              <span className="ParentMenuLabel">Contents</span>
            </NavLink>
          </li>
          <li className="ParentMenu">
            <NavLink
              to="/admin/add-content"
              activeClassName="active"
              className="ParentLink p-d-flex p-flex-column"
            >
              <i className="pi pi-cloud-upload"></i>
              <span className="ParentMenuLabel">Upload</span>
            </NavLink>
          </li>
          <li className="ParentMenu">
            <NavLink
              to="/admin/analytics"
              activeClassName="active"
              className="ParentLink p-d-flex p-flex-column"
            >
              <i className="pi pi-chart-line"></i>
              <span className="ParentMenuLabel">Analytics</span>
            </NavLink>
          </li>
          <li className="ParentMenu">
            <NavLink
              to="/admin/wallet"
              activeClassName="active"
              className="ParentLink p-d-flex p-flex-column"
            >
              <i className="pi pi-wallet"></i>
              <span className="ParentMenuLabel">Wallet</span>
            </NavLink>
          </li>
        </ul>

        <ul className="FooterMenu p-mt-auto">
          <li className="ParentMenu">
            <NavLink
              to="/admin/feedback"
              activeClassName="active"
              className="ParentLink p-d-flex p-flex-column"
            >
              <i className="pi pi-comments"></i>
              <span className="ParentMenuLabel">Feedback</span>
            </NavLink>
          </li>
          <li className="ParentMenu">
            <NavLink
              to="/admin/digital"
              activeClassName="active"
              className="ParentLink p-d-flex p-flex-column"
            >
              <i className="pi pi-globe"></i>
              <span className="ParentMenuLabel">DRM</span>
            </NavLink>
          </li>

          <li className="ParentMenu">
            <NavLink
              to="/admin/profile"
              activeClassName="active"
              className="ParentLink p-d-flex p-flex-column"
            >
              <i className="pi pi-user"></i>
              <span className="ParentMenuLabel">Profile</span>
            </NavLink>
          </li>
          <hr className="hr"></hr>
          <li className="ParentMenu">
            <NavLink
              to="/auth/login"
              className="ParentLink p-d-flex p-flex-column"
            >
              <i className="pi pi-power-off"></i>
              <span className="ParentMenuLabel">Logout</span>
            </NavLink>
          </li>
        </ul>
      </div>
    );
  }
}
export default SidebarComponent;
