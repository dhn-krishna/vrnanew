import React, { Component } from "react";
import "./UploadForm.scss";
import { InputText } from "primereact/inputtext";
import { InputTextarea } from "primereact/inputtextarea";
import { InputNumber } from "primereact/inputnumber";
import { MultiSelect } from "primereact/multiselect";
import { Dropdown } from "primereact/dropdown";
import { Chips } from "primereact/chips";
import { Button } from "primereact/button";
import { Toast } from "primereact/toast";
import ContentService from "../../../services/content.service";

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
    this.category = ["comedy", "drama", "romance", "triller", "historic"];
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
    var data = {
      moviename: this.state.moviename,
      country: this.state.country,
      year: this.state.year,
      certification: this.state.certification,
      description: this.state.description,
      posterurl: this.state.posterurl,
      language: this.state.language,
      producer: this.state.producer,
      director: this.state.director,
      cast: this.state.cast,
      musicdirector: this.state.musicdirector,
      genre: this.state.genre,
      partnerId: 2,
    };
    console.log(data);

    ContentService.create(data)
      .then((response) => {
        if (response.data) {
          this.showSuccess();
          this.setState({
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
            genre: []
          });
        } else {
          this.showError();
        }
      })
      .catch((e) => {
        console.log(e);
      });
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
                  value={this.state.moviename}
                  onChange={this.handleInputChange}
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
                  value={this.state.year}
                  onValueChange={(e) => this.setState({ year: e.value })}
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
                  value={this.state.certification}
                  onChange={this.handleInputChange}
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
                  value={this.state.description}
                  onChange={this.handleInputChange}
                />
                <label htmlFor="in">Description</label>
              </span>
            </div>

            <div className="p-col-6">
              <span className="p-float-label">
                <MultiSelect
                  className="w-100"
                  id="category"
                  filter
                  value={this.state.genre}
                  options={this.category}
                  onChange={(e) => this.setState({ genre: e.value })}
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
                  value={this.state.language}
                  onChange={this.handleInputChange}
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
                  value={this.state.producer}
                  onChange={(e) => this.setState({ producer: e.value })}
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
                  value={this.state.director}
                  onChange={(e) => this.setState({ director: e.value })}
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
                  value={this.state.musicdirector}
                  onChange={(e) => this.setState({ musicdirector: e.value })}
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
                  value={this.state.cast}
                  onChange={(e) => this.setState({ cast: e.value })}
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
export default UploadFormModule;
