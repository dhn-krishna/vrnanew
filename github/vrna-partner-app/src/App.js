import React, { Component } from "react";
import AppRouter from "./AppRouter";
import "primeicons/primeicons.css";
import "primereact/resources/primereact.min.css";

class App extends Component {
  render() {
    return (
      <div className="h-100">
        <AppRouter />
      </div>
    );
  }
}

export default App;
