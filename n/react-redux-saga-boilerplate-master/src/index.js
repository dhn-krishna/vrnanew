import React from 'react';
import ReactDOM from 'react-dom';
// import './index.css';
import "./assets/css/style.scss";
//import App from './App';
import App from './modules/app/routes'
import * as serviceWorker from './serviceWorker';
import { Provider } from "react-redux";
import store from "./config/store";
require('dotenv').config();

ReactDOM.render(
    <Provider store={store}>
        <App />
    </Provider>,
    document.getElementById('root')
);

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
