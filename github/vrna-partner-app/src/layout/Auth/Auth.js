import React, { Component } from "react";
import AuthRouter from "./AuthRouter";

class AuthLayout extends Component {

  render() {
    return (
      <div className="h-100">
        <AuthRouter/>
      </div>
    );
  }
}
export default AuthLayout;