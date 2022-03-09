import { Switch } from 'react-router-dom';
import React, { Suspense, lazy } from 'react';
import "primeicons/primeicons.css";
import "primereact/resources/primereact.min.css";
import { Router } from 'react-router';
import history from '../../config/history';
import PrivateRoute from '../../helpers/privateRoutes'; // Private Routes, Will only accessible after Login
import AuthRoute from '../../helpers/authRoutes'; // Auth Routes, Will only accessible before login.

// Lazy loading of all the components.
const Home = lazy(() => import('../Home'));
const Logout = lazy(() => import('../Home/logout'));
const Login = lazy(() => import('../Login'));
const Register = lazy(() => import('../Register'));
const ConfirmAccount = lazy(() => import('../Register/ConfirmAccount'));
const Book = lazy(() => import('../Book'));
const ManageBook = lazy(() => import('../Book/ManageBook'))
const Contents = lazy(() => import('../Contents'));
const AddContent = lazy(() => import('../AddContent'));
const Analytics = lazy(() => import('../Analytics'));
// const Analytics = lazy(() => import('../Analytics'));

// Root routes
const Routes = () => (
  <Router history={history}>
    <Suspense fallback={<div>Loading...</div>}>
      <Switch>
        <PrivateRoute exact path="/" component={Home}/>
        <AuthRoute path="/login" component={Login}/>
        <AuthRoute path="/register" component={Register}/>
        <AuthRoute path="/confirm-account" component={ConfirmAccount}/>
        <PrivateRoute path="/logout" component={Logout}/>
        <PrivateRoute path="/admin/contents" component={Contents}/>
        <PrivateRoute path="/admin/add-content" component={AddContent}/>
        <PrivateRoute path="/admin/analytics" component={Analytics}/>
        {/* <PrivateRoute path="/admin/analytics" component={Analytics}/> */}
        <PrivateRoute path="/manage-book/:id" component={ManageBook}/>
      </Switch>
    </Suspense>
  </Router>
);

export default Routes;