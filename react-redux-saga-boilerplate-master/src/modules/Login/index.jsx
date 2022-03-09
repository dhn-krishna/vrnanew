import React, {Component} from 'react';
import { connect } from 'react-redux';
import { Link, withRouter } from 'react-router-dom';
import { Formik } from 'formik';
import * as Yup from 'yup';
import { InputText } from "primereact/inputtext";
import { Button } from "primereact/button";
import "./Login.scss";
import Logo from "./assets/images/logo.png";
import './login.css';
import PropTypes from 'prop-types';
import { loginRequest,loginPageInit }  from './actions';
import FlashMessage from '../../components/FlashMessage/FlashMessage';
import { redirectForConfirm } from '../Register/ConfirmAccount/actions';
import { browserRedirect } from '../../helpers/helpers';


class Login extends Component {
    constructor(props){
        super(props);
        this.state = {
            email: ''
        }
        this.handleConfirmClick = this.handleConfirmClick.bind(this);
        this.handleLoginSubmit = this.handleLoginSubmit.bind(this);
    }

    messageForConfirm() {
        return (
            <span>
                You can confirm your account from <button type="button" className="confirm-button-link" onClick={this.handleConfirmClick}>here</button>.
            </span>
        );
    }

    handleConfirmClick(){
        this.props.redirectForConfirm(this.state.email);
        browserRedirect('/confirm-account');
    }

    handleLoginSubmit(email){
        this.setState({email})
    }

    render(){
        let {errors} = this.props;
        let err_message = errors.data?errors.data:errors.message;
        let confirm_message = err_message === "Account is not confirmed. Please confirm your account."?true:false;
        return(
            <div className="container">
                <div className="row">
                    <div className="col-md-6 mx-auto">
                    {Object.keys(errors).length > 0 &&
                        <div>
                            <FlashMessage data={err_message} alertClass="danger" />
                            {confirm_message &&
                                <div>{this.messageForConfirm()}</div>
                            }
                        </div>
                    }
                    </div>
                </div>
                <div className="row">
                    <div className="col-md-6 mx-auto">
                        <h1>Login</h1>
                        <Formik
                            initialValues={{ email: '', password:'' }}
                            onSubmit={this.props.onSubmitForm}
                            validationSchema={Yup.object().shape({
                                email: Yup.string()
                                .email()
                                .required('Required'),
                                password: Yup.string()
                                .required('Required').min(6),
                            })}
                            >
                            {props => {
                                const {
                                values,
                                touched,
                                errors,
                                isValid,
                                handleChange,
                                handleBlur,
                                handleSubmit,
                                } = props;
                                return (
                                    <form onSubmit={handleSubmit}>
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
                                        {/* <div className="form-group">
                                            <label htmlFor="exampleInputEmail1">Email address</label>
                                            <input type="email"
                                                id="email"
                                                value={values.email}
                                                onChange={handleChange}
                                                onBlur={handleBlur}
                                                className={
                                                    errors.email && touched.email ? 'form-control text-input error' : 'form-control text-input'
                                                } 
                                                placeholder="Enter email" 
                                            />
                                            {errors.email && touched.email && (
                                                <div className="input-feedback">{errors.email}</div>
                                            )}
                                            <small id="emailHelp" className="form-text text-muted">We'll never share your email with anyone else.</small>
                                        </div> 
                                        <div className="form-group">
                                            <label htmlFor="exampleInputPassword1">Password</label>
                                            <input type="password" 
                                                id="password"
                                                value={values.password}
                                                onChange={handleChange}
                                                onBlur={handleBlur}
                                                className={
                                                    errors.password && touched.password ? 'form-control text-input error' : 'form-control text-input'
                                                }
                                                placeholder="Password" 
                                            />
                                            {errors.password && touched.password && (
                                                <div className="input-feedback">{errors.password}</div>
                                            )}
                                        </div>
                                        <button type="submit" className="btn btn-primary" onClick={() => {
                                            this.handleLoginSubmit(values.email);
                                        }} disabled={!isValid}>Submit</button>
                                        <div className="form-group">
                                            Not registered yet? Register from <Link to="/register">here</Link>.
                                        </div> */}
                                    </form>
                                );
                            }}
                        </Formik>
                    </div>
                </div>
            </div>
        );
    }
}

Login.propTypes = {
    onSubmitForm: PropTypes.func,
    errors: PropTypes.object
};

function mapStateToProps(state){
    return { errors: state.login.errors};
}

function mapDispatchToProps(dispatch) {
    return {
      onSubmitForm: evt => {
        if (evt !== undefined && evt.preventDefault) evt.preventDefault();
        dispatch(loginRequest(evt));
      },
      onPageInit: dispatch(loginPageInit()),
      redirectForConfirm: email =>  dispatch(redirectForConfirm(email))
    };
}

export default connect(
    mapStateToProps,
    mapDispatchToProps,
)(withRouter(Login));