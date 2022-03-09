import React, { Component } from "react";
import { Link, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import "./AddContent.scss";
import { Steps } from "primereact/steps";
import UploadFormModule from "./UploadForm/UploadForm";
import { onChange }  from './actions';
import UploadModule from "./Upload/Upload";
import UploadFormConfirmModule from "./UploadFormConfirm/UploadFormConfirm";
class AddContent extends Component {
  constructor(props) {
    super(props);
    this.state = {
      activeIndex: 0,
    };
    this.items = [
      {
        label: "Content Details",
        command: (event) => {
          console.log("Content Details");
        },
      },
      {
        label: "Media Upload",
        command: (event) => {
          console.log("Media Upload");
        },
      },
      {
        label: "Confirmation",
        command: (event) => {
          console.log("Confirmation");
        },
      },
    ];
  }

  onNext() {
    console.log("test");
    this.setState({ activeIndex: 2 });
  }

  render() {
    return (
      <div className="AddContent">
        <Steps
          model={this.items}
          activeIndex={this.props.addContent.activeIndex}
          onSelect={(e) => {
            this.setState({ activeIndex: e.index });
          }}
          readOnly={true}
        />
        <div
          className={this.props.addContent.activeIndex === 0 ? "activeTab" : "inActiveTab"}
        >
          <UploadFormModule onNext={this.onNext} />
        </div>
        <div
          className={this.props.addContent.activeIndex === 1 ? "activeTab" : "inActiveTab"}
        >
          <UploadModule />
        </div>
        <div
          className={this.props.addContent.activeIndex === 2 ? "activeTab" : "inActiveTab"}
        >
          <UploadFormConfirmModule />
        </div>
      </div>
    );
  }
}
AddContent.propTypes = {
  // onChange: PropTypes.func,
  addContent: PropTypes.object,
  // onSubmitForm: PropTypes.func
};

function mapStateToProps(state){
  return { addContent: state.addContent};
}

// function mapDispatchToProps(dispatch) {
//   return {
//     onSubmitForm: data => {
//       // if (evt !== undefined && evt.preventDefault) evt.preventDefault();
//       dispatch(addContentRequest(data));
//     },
//     onChange:(name,value)=>dispatch(onChange({name,value}))
//   };
// }

export default connect(
  mapStateToProps,
  null,
)(withRouter(AddContent));
