import React, { Component } from "react";
import { Route, Switch, Redirect } from "react-router-dom";

import DashboardModule from "../../views/Dashboard/Dashboard";
import ContentsModule from "../../views/Contents/Contents";
import AddContentModule from "../../views/AddContent/AddContent";
import AnalyticsModule from "../../views/Analytics/Analytics";
import WalletModule from "../../views/Wallet/Wallet";
import ProfileModule from "../../views/Profile/Profile";
import FeedbackModule from "../../views/Feedback/Feedback";
import DigitalModule from "../../views/Digital/Digital";

class AdminRouter extends Component {
  render() {
    return (
      <Switch>
        <Route path="/admin/home" component={DashboardModule} />
        <Route path="/admin/contents" component={ContentsModule} />
        <Route path="/admin/add-content" component={AddContentModule} />
        <Route path="/admin/analytics" component={AnalyticsModule} />
        <Route path="/admin/wallet" component={WalletModule} />
        <Route path="/admin/profile" component={ProfileModule} />
        <Route path="/admin/feedback" component={FeedbackModule} />
        <Route path="/admin/digital" component={DigitalModule} />
        <Redirect from="/" to="/admin/home" />
      </Switch>
    );
  }
}

export default AdminRouter;
