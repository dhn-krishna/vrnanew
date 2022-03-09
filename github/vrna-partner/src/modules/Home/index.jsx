import React, {Component} from 'react';
import './Home.scss';
import { Link } from 'react-router-dom';

class Home extends Component {
    render(){
        //const user  = JSON.parse(localStorage.getItem('user'));
        return(
           
                <div className="DashboardModule">
                    <div className="p-grid">
                    <div className="p-col-12 p-sm-6 p-md-6 p-lg-6 p-xl-3">
                        <div className="p-p-1">
                        <div className="card widget-overview-box p-shadow-3">
                            <span className="overview-icon">
                            <i className="pi pi-shopping-cart"></i>
                            </span>
                            <span className="overview-title">Contents</span>
                            <div className="p-grid overview-detail">
                            <div className="p-col-6 ">
                                <div className="overview-number">10</div>
                                <div className="overview-subtext">Pending</div>
                            </div>
                            <div className="p-col-6">
                                <div className="overview-number">20</div>
                                <div className="overview-subtext">Approved</div>
                            </div>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div className="p-col-12 p-sm-6 p-md-6 p-lg-6 p-xl-3">
                        <div className="p-p-1">
                        <div className="card widget-overview-box p-shadow-3">
                            <span className="overview-icon">
                            <i className="pi pi-shopping-cart"></i>
                            </span>
                            <span className="overview-title">Orders</span>
                            <div className="p-grid overview-detail">
                            <div className="p-col-6 ">
                                <div className="overview-number">640</div>
                                <div className="overview-subtext">Pending</div>
                            </div>
                            <div className="p-col-6">
                                <div className="overview-number">1420</div>
                                <div className="overview-subtext">Completed</div>
                            </div>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div className="p-col-12 p-sm-6 p-md-6 p-lg-6 p-xl-3">
                        <div className="p-p-1">
                        <div className="card widget-overview-box p-shadow-3">
                            <span className="overview-icon">
                            <i className="pi pi-shopping-cart"></i>
                            </span>
                            <span className="overview-title">Orders</span>
                            <div className="p-grid overview-detail">
                            <div className="p-col-6 ">
                                <div className="overview-number">640</div>
                                <div className="overview-subtext">Pending</div>
                            </div>
                            <div className="p-col-6">
                                <div className="overview-number">1420</div>
                                <div className="overview-subtext">Completed</div>
                            </div>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div className="p-col-12 p-sm-6 p-md-6 p-lg-6 p-xl-3">
                        <div className="p-p-1">
                        <div className="card widget-overview-box p-shadow-3">
                            <span className="overview-icon">
                            <i className="pi pi-shopping-cart"></i>
                            </span>
                            <span className="overview-title">Orders</span>
                            <div className="p-grid overview-detail">
                            <div className="p-col-6 ">
                                <div className="overview-number">640</div>
                                <div className="overview-subtext">Pending</div>
                            </div>
                            <div className="p-col-6">
                                <div className="overview-number">1420</div>
                                <div className="overview-subtext">Completed</div>
                            </div>
                            </div>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
            
        );
    }
}

export default Home;