import React, { Component } from "react";
import { Route, Switch } from "react-router-dom";

import Login from "../../auth/login/Login";

class AuthRouter extends Component {
  render() {
    return (
      <Switch>
        <Route path="/auth/login" component={Login} />
      </Switch>
    );
  }
}

export default AuthRouter;
