import React, { Component } from "react";
import "./Admin.scss";
import SidebarComponent from "../../components/sidebar/SidebarComponent";
import TopbarComponent from "../../components/topbar/TopbarComponent";
import AdminRouter from "./AdminRouter";
import { ScrollPanel } from "primereact/scrollpanel";

class AdminLayout extends Component {
  state = {
    sideMenu: [
      {
        id: 1,
        url: "/admin/home",
        iconClass: "pi pi-th-large",
        iconName: null,
        menu: "",
        label: "Dashboard",
        order: "1",
      },
      {
        id: 2,
        url: "/admin/content",
        iconClass: "pi pi-video",
        iconName: null,
        menu: "",
        label: "Contents",
        order: "2",
      },
      {
        id: 3,
        url: "/admin/add-content",
        iconClass: "pi-chart-line",
        iconName: null,
        menu: "",
        label: "Analytics",
        order: "3",
      },
      {
        id: 4,
        url: "/admin/wallet",
        iconClass: "pi-wallet",
        iconName: null,
        menu: "",
        label: "Wallet",
        order: "4",
      },
    ],
  };

  render() {
    return (
      <div className="h-100 AdminContainer">
        <TopbarComponent />

        <div className="p-d-flex ContainerLayout">
          <div className="SideNavMain">
            <SidebarComponent />
          </div>

          <div className="MainContainer p-p-2">
            <ScrollPanel
              style={{ width: "100%", height: "100%" }}
              className="custom"
            >
              <AdminRouter />
            </ScrollPanel>
          </div>
        </div>
      </div>
    );
  }
}
export default AdminLayout;
