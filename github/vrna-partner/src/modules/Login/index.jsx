import React, {Component} from 'react';
import { connect } from 'react-redux';
import { Link, withRouter } from 'react-router-dom';
import { InputText } from "primereact/inputtext";
import { Button } from "primereact/button";
import Logo from "../../assets/images/logo.png";
import './Login.scss';
import PropTypes from 'prop-types';
import { loginRequest,loginPageInit, onChange }  from './actions';
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

    onSubmit=()=>{
      const {email,password}=this.props.login;
      this.props.onSubmitForm({'email':email,'password':password});
    }

    render(){
        let {login} = this.props;
        console.log('login',login);
        // let err_message = errors.data?errors.data:errors.message;
        // let confirm_message = err_message === "Account is not confirmed. Please confirm your account."?true:false;
        return(
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
                      name="email"
                      value={this.props.login.email}
                      onChange={(e)=>{this.props.onChange(e.target.name,e.target.value)}}
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
                      type="password"
                      name="password"
                      value={this.props.login.password}
                      onChange={(e)=>{this.props.onChange(e.target.name,e.target.value)}}
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

Login.propTypes = {
    onSubmitForm: PropTypes.func,
    login: PropTypes.object
};

function mapStateToProps(state){
    return { login: state.login};
}

function mapDispatchToProps(dispatch) {
    return {
      onSubmitForm: data => {
        // if (evt !== undefined && evt.preventDefault) evt.preventDefault();
        dispatch(loginRequest(data));
      },
      onPageInit: dispatch(loginPageInit()),
      onChange:(name,value)=>dispatch(onChange({name,value})),
      redirectForConfirm: email =>  dispatch(redirectForConfirm(email))
    };
}

export default connect(
    mapStateToProps,
    mapDispatchToProps,
)(withRouter(Login));