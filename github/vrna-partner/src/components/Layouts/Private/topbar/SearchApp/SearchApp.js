import React, { Component } from "react";
import { AutoComplete } from "primereact/autocomplete";

class SearchApp extends Component {
  render() {
    return (
      <div>
        <AutoComplete placeholder="Search" type="text" />
      </div>
    );
  }
}
export default SearchApp;
