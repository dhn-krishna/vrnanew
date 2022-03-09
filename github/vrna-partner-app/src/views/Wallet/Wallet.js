import React, { Component } from "react";
import "./Wallet.scss";
import { Divider } from "primereact/divider";
import { DataTable } from "primereact/datatable";
import { Column } from "primereact/column";
import { InputText } from "primereact/inputtext";
class WalletModule extends Component {
  state = {
    globalFilter: null,
    transactions: [
      {
        id: 1,
        type: "Credit",
        name: "Bhoomi",
        date: "2021-09-02",
        amount: 120,
      },
      {
        id: 2,
        type: "Credit",
        name: "Bhoomi",
        date: "2021-09-02",
        amount: 120,
      },
      {
        id: 3,
        type: "Credit",
        name: "Darbar",
        date: "2020-07-05",
        amount: 90,
      },
      {
        id: 4,
        type: "Credit",
        name: "Darbar",
        date: "2020-03-11",
        amount: 90,
      },
    ],
  };
  renderHeader() {
    return (
      <div className="table-header p-d-flex p-jc-between">
        <div className="table-header p-my-auto">Transaction History</div>
        <span className="p-input-icon-left">
          <i className="pi pi-search" />
          <InputText
            type="search"
            onInput={(e) => this.setState({ globalFilter: e.target.value })}
            placeholder="Global Search"
          />
        </span>
      </div>
    );
  }

  render() {
    const header = this.renderHeader();
    return (
      <div className="Wallet ">
        <h2 className="p-pl-2">Wallet</h2>
        <Divider />
        <div className="p-grid">
          <div className="balance-card p-shadow-2 p-p-3 bg-w p-col-6 p-offset-3">
            <div className="balance-title">Total Balance</div>
            <div className="balance-number p-text-center">$ 9,6500.00 /-</div>
            <div className="p-text-center">
              <button className="balance-btn">Withdraw</button>
            </div>
          </div>
        </div>
        <div className="TransactionsTable p-mt-3 p-shadow-1">
          <DataTable
            className="p-datatable-striped"
            value={this.state.transactions}
            rowHover
            header={header}
            globalFilter={this.state.globalFilter}
          >
            <Column field="id" header="ID"></Column>
            <Column field="type" header="Transafer Type"></Column>
            <Column field="name" header="Content Name"></Column>
            <Column field="date" header="Date"></Column>
            <Column field="amount" header="Amount"></Column>
          </DataTable>
        </div>
      </div>
    );
  }
}
export default WalletModule;
