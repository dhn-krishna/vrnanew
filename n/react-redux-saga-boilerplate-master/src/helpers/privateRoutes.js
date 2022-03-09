import React from 'react';
import { Route, Redirect } from 'react-router-dom';
import PropTypes from 'prop-types';
import { checkAuthorization } from '../helpers/helpers';
import Header from '../components/Layouts/Private/Header';
import TopbarComponent from '../components/Layouts/Private/topbar/TopbarComponent';
import SidebarComponent from '../components/Layouts/Private/sidebar/SidebarComponent';
import { ScrollPanel } from "primereact/scrollpanel";
import "./Admin.scss";

const PrivateRoute = ({
  component: Component,
  redirect: pathname,
  ...rest
}) => {
  const Routes = (props) => {
    if(checkAuthorization() === true){
      return (
        <div className="h-100 AdminContainer">
              <TopbarComponent />
              <div className="p-d-flex ContainerLayout">
                <div className="SideNavMain">
                  <SidebarComponent/>
                </div>
                <div className="MainContainer p-p-2">
                <ScrollPanel
                  style={{ width: "100%", height: "100%" }}
                  className="custom"
                >
                  <Route
                    {...rest}
                    render={props =>
                        <Component {...rest} {...props} />
                    }
                  />
              </ScrollPanel>
        </div>
            </div>
            </div>
      );
      
    }else {
      return (
        <Redirect 
          to={{
            pathname,
            state: { from: props.location },
          }}
        />
      );
    }
  }
  return (
    <Routes />
  );
};

PrivateRoute.defaultProps = { redirect: '/login' };

PrivateRoute.propTypes = {
  component: PropTypes.object.isRequired,
  redirect: PropTypes.string,
};

export default PrivateRoute;