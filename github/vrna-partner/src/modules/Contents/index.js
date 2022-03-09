import React, { Component } from "react";
import { Link, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import "./Contents.scss";
import { DataView, DataViewLayoutOptions } from "primereact/dataview";
import { Dropdown } from "primereact/dropdown";
import ProductService from "./ProductService";
import { contentListRequest, onChange }  from './actions';
import { Button } from "primereact/button";
import { SplitButton } from "primereact/splitbutton";
import { confirmDialog } from "primereact/confirmdialog";
import { Toast } from "primereact/toast";
// import ContentService from "../../services/content.service";
import placeholder from "../../assets/images/poster-placeholder.jpg";

class Contents extends Component {
  constructor(props) {
    super(props);
    this.state = {
      contents: null,
      layout: "list",
      sortKey: null,
      sortOrder: null,
      sortField: null,
      confirmationVisible: false,
      splitbutton: [
        {
          label: "Edit",
          icon: "pi pi-pencil",
          command: () => {},
        },
        {
          label: "Delete",
          icon: "pi pi-times",
          command: () => {},
        },
      ],
    };

    this.sortOptions = [
      { label: "Sort A to Z", value: "name" },
      { label: "Sort Z to A", value: "!name" },
    ];

    this.productService = new ProductService();
    this.itemTemplate = this.itemTemplate.bind(this);
    this.onSortChange = this.onSortChange.bind(this);
  }

  componentDidMount() {
    this.props.onFetchContent();
  }

  onSortChange(event) {
    const value = event.value;

    if (value.indexOf("!") === 0) {
      this.setState({
        sortOrder: -1,
        sortField: value.substring(1, value.length),
        sortKey: value,
      });
    } else {
      this.setState({
        sortOrder: 1,
        sortField: value,
        sortKey: value,
      });
    }
  }

  renderListItem(data) {
    const genres = data.genre.map((element, i) => {
      return (
        <span className="p-ml-0" key={i}>
          {element}
        </span>
      );
    });
    const stars = data.cast.map((element, i) => {
      return (
        <span className="p-ml-0" key={i}>
          {element}
        </span>
      );
    });
    const music = data.musicdirector.map((element, i) => {
      return (
        <span className="p-ml-0" key={i}>
          {element}
        </span>
      );
    });

    const unplublish = () => {
      confirmDialog({
        message: "Are you sure you want to proceed?",
        header: "Confirmation",
        icon: "pi pi-exclamation-triangle",
        accept,
        reject,
      });
    };

    const accept = () => {
      console.log("Yes, deleted");
    };

    const reject = () => {
      console.log("Not deleted");
    };

    return (
      <div className="p-col-12 p-mb-2">
        <div className="content-list-item p-shadow-2">
          <img
            src={placeholder}
            onError={(e) =>
              (e.target.src = {placeholder})
            }
            alt={data.moviename}
          />
          <div className="content-list-detail">
            <div className="p-d-flex p-jc-between">
              <div className="">
                <div className="content-name">
                  {data.moviename} ({data.year})
                </div>
                <div className="content-description">{data.description}</div>
              </div>
              <div className="">
                <SplitButton
                  label="Unpublish"
                  icon="pi pi-ban"
                  onClick={unplublish}
                  model={this.state.splitbutton}
                ></SplitButton>
              </div>
            </div>

            <div className="summary_item">
              <table>
                <tbody>
                  <tr>
                    <th>Producer</th>
                    <td>: {data.producer}</td>
                  </tr>

                  <tr>
                    <th>Director</th>
                    <td>: {data.director}</td>
                  </tr>

                  <tr>
                    <th>Genres</th>
                    <td>: {genres}</td>
                  </tr>

                  <tr>
                    <th>Stars</th>
                    <td>: {stars}</td>
                  </tr>

                  <tr>
                    <th>Music</th>
                    <td>: {music}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    );
  }

  renderGridItem(data) {
    const genres = data.genre.map((element, i) => {
      return (
        <span className="p-ml-0" key={i}>
          {element}
        </span>
      );
    });
    const stars = data.cast.map((element, i) => {
      return (
        <span className="p-ml-0" key={i}>
          {element}
        </span>
      );
    });
    return (
      <div className="p-col-12 p-sm-12 p-md-6 p-lg-4 p-xl-3">
        <div className="content-grid-item card p-shadow-4 p-p-3">
          <div className="content-grid-item-top">
            <div>
              <span className="content-certificate">{data.certificate}</span>
            </div>
            <span className="content-year">{data.year}</span>
          </div>
          <div className="content-grid-item-content">
            <img
              className="p-shadow-9"
              src={placeholder}
              onError={(e) =>
                (e.target.src = {placeholder})
              }
              alt={data.moviename}
            />
            <div className="content-name">{data.moviename}</div>
            <div className="content-description">{data.description}</div>

            <div className="p-d-flex p-flex-column content-grid-item-bottom">
              <div className="summary_item p-d-flex p-py-1">
                <table>
                  <tbody>
                    <tr>
                      <th>Producer:</th>
                      <td>{data.producer}</td>
                    </tr>

                    <tr>
                      <th>Director:</th>
                      <td>{data.director}</td>
                    </tr>

                    <tr>
                      <th>Genres:</th>
                      <td>{genres}</td>
                    </tr>

                    <tr>
                      <th>Stars:</th>
                      <td>{stars}</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  itemTemplate(content, layout) {
    if (!content) {
      return;
    }

    if (layout === "list") return this.renderListItem(content);
    else if (layout === "grid") return this.renderGridItem(content);
  }

  renderHeader() {
    const handleClick = () => {
      this.props.history.push("/admin/add-content");
    };
    return (
      <div className="p-grid p-nogutter">
        <div className="p-col-6" style={{ textAlign: "left" }}>
          <Dropdown
            options={this.sortOptions}
            value={this.state.sortKey}
            optionLabel="label"
            placeholder="Sort"
            onChange={this.onSortChange}
          />
        </div>
        <div className="p-col-6" style={{ textAlign: "right" }}>
          <div className="p-d-flex p-jc-end">
            <Button
              className="p-mr-2"
              icon="pi pi-cloud-upload"
              onClick={handleClick}
              label="Upload"
            />

            <DataViewLayoutOptions
              layout={this.state.layout}
              onChange={(e) => this.setState({ layout: e.value })}
            />
          </div>
        </div>
      </div>
    );
  }

  render() {
    const header = this.renderHeader();

    return (
      <div className="ContentsModule">
        <div className="content-section implementation dataview-demo">
          <div className="card">
            <DataView
              value={this.props.content.data !== null?this.props.content.data.data.data:[]}
              layout={this.state.layout}
              header={header}
              itemTemplate={this.itemTemplate}
              paginator
              rows={9}
              sortOrder={this.state.sortOrder}
              sortField={this.state.sortField}
            />
          </div>
        </div>
        <Toast />
      </div>
    );
  }
}
Contents.propTypes = {
  onFetchContent: PropTypes.func,
  content: PropTypes.object
};

function mapStateToProps(state){
  return { content: state.content};
}

function mapDispatchToProps(dispatch) {
  return {
    onFetchContent: () =>dispatch(contentListRequest()),
  };
}

export default connect(
  mapStateToProps,
  mapDispatchToProps,
)(withRouter(Contents));
