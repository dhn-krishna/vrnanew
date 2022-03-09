import React, { Component } from "react";
import { Link, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import { onChange,addContentRequest }  from '../actions';
import "./UploadForm.scss";
import { InputText } from "primereact/inputtext";
import { InputTextarea } from "primereact/inputtextarea";
import { InputNumber } from "primereact/inputnumber";
import { MultiSelect } from "primereact/multiselect";
import { Dropdown } from "primereact/dropdown";
import { Chips } from "primereact/chips";
import { Button } from "primereact/button";
import { Toast } from "primereact/toast";
// import ContentService from "../../../services/content.service";

class UploadFormModule extends Component {
  constructor(props) {
    super(props);
    this.state = {
      moviename: "",
      country: "",
      year: null,
      certification: "",
      description: "",
      posterurl: "",
      language: "",
      producer: [],
      director: [],
      cast: [],
      musicdirector: [],
      genre: [],
      partnerId: 2,
    };
    this.category = ["comedy", "drama", "romance", "thriller", "historic"];
    this.languages = [
      "Tamil",
      "English",
      "Malayalam",
      "Hindi",
      "Kanada",
      "Bengali",
      "Telugu",
      "Marathi",
      "Odishi",
      "Urudu",
    ];

    this.handleInputChange = this.handleInputChange.bind(this);
    this.saveContent = this.saveContent.bind(this);
    this.showSuccess = this.showSuccess.bind(this);
  }

  handleInputChange(event) {
    const target = event.target;
    const value = target.type === "checkbox" ? target.checked : target.value;
    const name = target.name;
    this.setState({
      [name]: value,
    });
  }

  saveContent() {
    var userId = localStorage.getItem('userId');
    var data = {
      'moviename': this.props.addContent.moviename,
      'country': this.props.addContent.country,
      'year': this.props.addContent.year,
      'certification': this.props.addContent.certification,
      'description': this.props.addContent.description,
      // posterurl: this.props.addContent.posterurl,
      'language': this.props.addContent.language,
      'producer': this.props.addContent.producer,
      'director': this.props.addContent.director,
      'cast': this.props.addContent.cast,
      'musicdirector': this.props.addContent.musicdirector,
      'genre': this.props.addContent.genre,
      'partnerId': userId,
    };
    this.props.onSubmitForm(data);
    this.props.onChange('activeIndex',1);
    // var data = {
    //   moviename: this.state.moviename,
    //   country: this.state.country,
    //   year: this.state.year,
    //   certification: this.state.certification,
    //   description: this.state.description,
    //   posterurl: this.state.posterurl,
    //   language: this.state.language,
    //   producer: this.state.producer,
    //   director: this.state.director,
    //   cast: this.state.cast,
    //   musicdirector: this.state.musicdirector,
    //   genre: this.state.genre,
    //   partnerId: 2,
    // };
    // console.log(data);

    // ContentService.create(data)
    //   .then((response) => {
    //     if (response.data) {
    //       this.showSuccess();
    //       this.setState({
    //         moviename: "",
    //         country: "",
    //         year: null,
    //         certification: "",
    //         description: "",
    //         posterurl: "",
    //         language: "",
    //         producer: [],
    //         director: [],
    //         cast: [],
    //         musicdirector: [],
    //         genre: []
    //       });
    //     } else {
    //       this.showError();
    //     }
    //   })
    //   .catch((e) => {
    //     console.log(e);
    //   });
  }

  showSuccess() {
    this.toast.show({
      severity: "success",
      summary: "Success ",
      detail: "Content uploaded successfully.",
      life: 3000,
    });
  }

  showError() {
    this.toast.show({
      severity: "error",
      summary: "Error",
      detail: "Content upload failed.",
      life: 3000,
    });
  }

  render() {
    console.log('thisprops',this.props.addContent);
    return (
      <div className="UploadFormMain p-shadow-3">
        <Toast ref={(el) => (this.toast = el)} />
        <form>
          <div className="p-grid">
            <div className="p-sm-12 p-md-12 p-lg-12">
              <span className="p-float-label">
                <InputText
                  className="w-100"
                  id="title"
                  name="moviename"
                  value={this.props.addContent.moviename}
                  onChange={(e)=>{this.props.onChange(e.target.name,e.target.value)}}
                />
                <label htmlFor="title">Title</label>
              </span>
            </div>

            <div className="p-sm-12 p-md-12 p-lg-6">
              <span className="p-float-label">
                <InputNumber
                  className="w-100"
                  id="year"
                  name="year"
                  useGrouping={false}
                  max={9999}
                  value={this.props.addContent.year}
                  onValueChange={(e)=>{this.props.onChange(e.target.name,e.target.value)}}
                />
                <label htmlFor="year">Year</label>
              </span>
            </div>

            <div className="p-sm-12 p-md-12 p-lg-6">
              <span className="p-float-label">
                <InputText
                  className="w-100"
                  id="certification"
                  name="certification"
                  value={this.props.addContent.certification}
                  onChange={(e)=>{this.props.onChange(e.target.name,e.target.value)}}
                />
                <label htmlFor="certification">Certification</label>
              </span>
            </div>

            <div className="p-col-12">
              <span className="p-float-label">
                <InputTextarea
                  className="w-100"
                  id="description"
                  rows={5}
                  cols={30}
                  autoResize
                  name="description"
                  value={this.props.addContent.description}
                  onChange={(e)=>{this.props.onChange(e.target.name,e.target.value)}}
                />
                <label htmlFor="in">Description</label>
              </span>
            </div>

            <div className="p-col-6">
              <span className="p-float-label">
                <MultiSelect
                  className="w-100"
                  id="category"
                  name="category"
                  filter
                  value={this.props.addContent.category}
                  options={this.category}
                  onChange={(e)=>{this.props.onChange(e.target.name,e.target.value)}}
                />
                <label htmlFor="category">Category</label>
              </span>
            </div>

            <div className="p-col-6">
              <span className="p-float-label">
                <Dropdown
                  className="w-100"
                  id="language"
                  name="language"
                  options={this.languages}
                  value={this.props.addContent.language}
                  onChange={(e)=>{this.props.onChange(e.target.name,e.target.value)}}
                />
                <label htmlFor="language">Language</label>
              </span>
            </div>

            <div className="p-col-12">
              <span className="p-float-label">
                <Chips
                  className="producer-chips w-100"
                  id="producer"
                  name="producer"
                  value={this.props.addContent.producer}
                  onChange={(e)=>{this.props.onChange(e.target.name,e.target.value)}}
                  separator=","
                ></Chips>
                <label htmlFor="producer">Producer</label>
              </span>
              <span className="helper-text">Press Enter after each entry</span>
            </div>

            <div className="p-col-12">
              <span className="p-float-label">
                <Chips
                  className="director-chips w-100"
                  id="director"
                  name="director"
                  value={this.props.addContent.director}
                  onChange={(e)=>{this.props.onChange(e.target.name,e.target.value)}}
                  separator=","
                ></Chips>
                <label htmlFor="director">Director</label>
              </span>
              <span className="helper-text">Press Enter after each entry</span>
            </div>

            <div className="p-col-12">
              <span className="p-float-label">
                <Chips
                  className="musicdirector-chips w-100"
                  id="musicdirector"
                  name="musicdirector"
                  value={this.props.addContent.musicdirector}
                  onChange={(e)=>{this.props.onChange(e.target.name,e.target.value)}}
                  separator=","
                ></Chips>
                <label htmlFor="musicdirector">Musician</label>
              </span>
              <span className="helper-text">Press Enter after each entry</span>
            </div>

            <div className="p-col-12">
              <span className="p-float-label">
                <Chips
                  className="cast-chips w-100"
                  id="cast"
                  name="cast"
                  value={this.props.addContent.cast}
                  onChange={(e)=>{this.props.onChange(e.target.name,e.target.value)}}
                  separator=","
                ></Chips>
                <label htmlFor="cast">Artists</label>
              </span>
              <span className="helper-text">Press Enter after each entry</span>
            </div>

            <div className="p-col-12 p-text-right">
              <Button
                className="upload-poster-btn p-button-success p-m-1"
                label="Save"
                icon="pi pi-arrow-right"
                iconPos="right"
                type="button"
                onClick={this.saveContent}
              />
            </div>
          </div>
        </form>
      </div>
    );
  }
}
UploadFormModule.propTypes = {
  onChange: PropTypes.func,
  addContent: PropTypes.object,
  onSubmitForm: PropTypes.func
};

function mapStateToProps(state){
  return { addContent: state.addContent};
}

function mapDispatchToProps(dispatch) {
  return {
    onSubmitForm: data => {
      // if (evt !== undefined && evt.preventDefault) evt.preventDefault();
      dispatch(addContentRequest(data));
    },
    onChange:(name,value)=>dispatch(onChange({name,value}))
  };
}

export default connect(
  mapStateToProps,
  mapDispatchToProps,
)(withRouter(UploadFormModule));
