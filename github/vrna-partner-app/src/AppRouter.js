import React, { Component } from "react";
import { Route, Switch, Redirect } from "react-router-dom";

import AdminLayout from "./layout/Admin/Admin";
import AuthLayout from "./layout/Auth/Auth";

class AppRouter extends Component {
  render() {
    return (
      <Switch>
        <Route path="/admin" render={(props) => <AdminLayout {...props} />} />
        <Route path="/auth" render={(props) => <AuthLayout {...props} />} />
        <Redirect from="/" to="/admin" />
      </Switch>
    );
  }
}

export default AppRouter;
