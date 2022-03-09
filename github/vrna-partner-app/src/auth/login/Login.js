import React, { Component } from "react";
import { InputText } from "primereact/inputtext";
import { Button } from "primereact/button";
import "./Login.scss";
import Logo from "../../assets/images/logo.png";
import { Redirect } from "react-router-dom";

class Login extends Component {
  state = {
    visiblePwd: true,
    pwdType: "password",
    pwdIcon: "pi pi-eye pointer",
    isLoggedIn: false,
  };

  toggleVisiblePwd = () => {
    console.log("pwd called");
    console.log(this.state.pwdType);
    if (this.state.visiblePwd) {
      this.setState({
        pwdType: "text",
        visiblePwd: false,
        pwdIcon: "pi pi-eye-slash pointer",
      });
    } else {
      this.setState({
        pwdType: "password",
        visiblePwd: true,
        pwdIcon: "pi pi-eye pointer",
      });
    }
  };

  onSubmit = () => {
    console.log("route here");
    this.setState({
      isLoggedIn: true,
    });
  };

  render() {
    if (this.state.isLoggedIn) {
      return <Redirect to="/admin" />;
    }
    return (
      <div className="Login h-100">
        <div className="p-grid h-100 p-m-0">
          <div className="LeftPanel p-p-0 p-col-5 p-sm-5 p-lg-5 p-md-5 p-xl-5">
            <div className="p-d-flex p-jc-center LeftImage"></div>
          </div>
          <div className="RightPanel p-col-7 p-sm-7 p-lg-7 p-md-7 p-xl-7 h-100">
            <div className="p-d-flex p-flex-column p-jc-center h-98">
              <div className="p-text-center logo">
                <img className="p-p-2" alt="VRNA" src={Logo} />
              </div>

              <div className="p-p-2 p-as-center login-form">
                <div className="p-mb-5">
                  <label htmlFor="email" className="p-d-block">
                    Email
                  </label>
                  <span className="p-float-label p-input-icon-left w-100">
                    <i className="pi pi-user" />
                    <InputText
                      className="w-100"
                      id="email"
                      type="email"
                      placeholder="email@vrnaplex.com"
                    />
                  </span>
                </div>
                <div className="p-mb-5">
                  <label htmlFor="password" className="p-d-block">
                    Password
                  </label>
                  <span className="p-input-icon-left p-input-icon-right w-100">
                    <i className="pi pi-unlock" />
                    <i
                      className={this.state.pwdIcon}
                      onClick={this.toggleVisiblePwd}
                    />
                    <InputText
                      className="w-100"
                      id="password"
                      type={this.state.pwdType}
                      placeholder="password"
                    />
                  </span>
                </div>
                <div>
                  <Button
                    className="w-100"
                    label="Login"
                    onClick={this.onSubmit}
                  />
                </div>
              </div>

              <div className="ForgotPassword p-text-center p-mt-5">
                Forgot Password ?
              </div>
            </div>
            <footer className="p-text-center">
              Copyright © 2021 by VRNA Plex, Inc. All Rights Reserved.
            </footer>
          </div>
        </div>
      </div>
    );
  }
}
export default Login;
