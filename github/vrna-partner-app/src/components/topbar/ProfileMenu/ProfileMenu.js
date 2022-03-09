import React, { Component } from "react";
import { Menu } from "primereact/menu";
import { Button } from "primereact/button";
import { Toast } from "primereact/toast";

class ProfileMenu extends Component {
  constructor(props) {
    super(props);
    this.navigate = true;
    this.router = undefined;
    this.items = [
      {
        label: "Profile",
        icon: "pi pi-user",
        command: () => {
          this.toast.show({
            severity: "success",
            summary: "Updated",
            detail: "Data Updated",
            life: 3000,
          });
        },
      },
      {
        label: "Send Feedback",
        icon: "pi pi-comments",
        command: () => {
          this.toast.show({
            severity: "warn",
            summary: "Delete",
            detail: "Data Deleted",
            life: 3000,
          });
        },
      },
      {
        label: "Digital Rights",
        icon: "pi pi-globe",
        command: () => {
          this.toast.show({
            severity: "warn",
            summary: "Delete",
            detail: "Data Deleted",
            life: 3000,
          });
        },
      },
      {
        separator: true,
      },
      {
        label: "Logout",
        icon: "pi pi-fw pi-power-off",
      },
    ];
  }
  render() {
    return (
      <div className="">
        <Toast
          ref={(el) => {
            this.toast = el;
          }}
        ></Toast>

        <div className="card">
          <Menu
            model={this.items}
            popup
            ref={(el) => (this.menu = el)}
            id="popup_menu"
          />
          <Button
            icon="pi pi-user"
            onClick={(event) => this.menu.toggle(event)}
            aria-controls="popup_menu"
            aria-haspopup
          />
        </div>
      </div>
    );
  }
}
export default ProfileMenu;
