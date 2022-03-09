import React, { Component } from "react";
import { Link, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import { onChange,addContentPosterRequest, addContentBannerRequest,addContentRequest }  from '../actions';
import "./Upload.scss";
import { Button } from "primereact/button";

import posterPlaceholder from "../../../assets/images/poster-placeholder.jpg";

class UploadModule extends Component {
  constructor(props) {
    super(props);
    this.state = {
      posterurl:'',
      moviebannerurl:''
    };
  }

  onFileChange=(e)=>{
    var name = e.target.name;
    var fileValue = e.target.files[0];
    this.setState({
      [name]: URL.createObjectURL(e.target.files[0])
    })
    this.props.onChange(name,fileValue);
    // alert('hi');
    // console.log(e.target.name);
    // console.log(e.target.files[0]);
  }

  saveContentPoster =()=> {
    var userId = localStorage.getItem('userId');
    const dataArray = new FormData();
    dataArray.append("file",this.props.addContent.posterurl)
    // dataArray.append("moviename", this.props.addContent.moviename);
    // dataArray.append("country", this.props.addContent.country);
    // dataArray.append("year", this.props.addContent.year);
    // dataArray.append("certification", this.props.addContent.certification);
    // dataArray.append("description", this.props.addContent.description);
    // dataArray.append("language", this.props.addContent.language);
    // dataArray.append("producer", this.props.addContent.producer);
    // dataArray.append("director", this.props.addContent.director);
    // dataArray.append("cast", this.props.addContent.cast);
    // dataArray.append("musicdirector", this.props.addContent.musicdirector);
    // dataArray.append("genre", this.props.addContent.genre);
    // dataArray.append("posterurl", this.props.addContent.posterurl);
    // dataArray.append("trailerurl", this.props.addContent.trailerurl);
    // dataArray.append("filepath", this.props.addContent.filepath);
    // dataArray.append("moviebannerurl", this.props.addContent.moviebannerurl);
    // dataArray.append("partnerId", userId);


    // dataArray.append("superHeroName", superHero);
    // dataArray.append("superHeroName", superHero);
    // dataArray.append("superHeroName", superHero);
    // dataArray.append("superHeroName", superHero);
    // dataArray.append("superHeroName", superHero);
    // var data = {
    //   'moviename': this.props.addContent.moviename,
    //   'country': this.props.addContent.country,
    //   'year': this.props.addContent.year,
    //   'certification': this.props.addContent.certification,
    //   'description': this.props.addContent.description,
    //   // posterurl: this.props.addContent.posterurl,
    //   'language': this.props.addContent.language,
    //   'producer': this.props.addContent.producer,
    //   'director': this.props.addContent.director,
    //   'cast': this.props.addContent.cast,
    //   'musicdirector': this.props.addContent.musicdirector,
    //   'genre': this.props.addContent.genre,
    //   'partnerId': userId,
    // };
    this.props.onSubmitForm(dataArray);
  }
  
  saveContentBanner=()=>{
    const dataArray1 = new FormData();
    dataArray1.append("file",this.props.addContent.moviebannerurl)
    this.props.onSubmitBanner(dataArray1);
  }

  nextContent=(nextProps)=>{
    var userId = localStorage.getItem('userId');
    console.log(nextProps);
    console.log(this.props);
    var data = {
      'moviename': this.props.addContent.moviename,
      'country': this.props.addContent.country,
      'year': this.props.addContent.year,
      'certification': this.props.addContent.certification,
      'description': this.props.addContent.description,
      'posterurl': this.props.addContent.posterUrlData,
      // 'bannerurl':this.props.addContent.bannerurl,
      'language': this.props.addContent.language,
      'producer': this.props.addContent.producer,
      'director': this.props.addContent.director,
      'cast': this.props.addContent.cast,
      'musicdirector': this.props.addContent.musicdirector,
      'genre': this.props.addContent.genre,
      'partnerId': userId,
    };
    this.props.onSubmitFormData(data);
    // this.props.onChange('activeIndex',1);
    this.props.onChange('activeIndex',2);
  }

  preview_image = (event) => {
    console.log(event);
    var reader = new FileReader();
    reader.onload = function () {
      var output = document.getElementById("output_image");
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };

  render() {
    console.log('ldskfj',this.state);
    return (
      <div className="UploadModule">
        <div className="p-grid nested-grid p-m-1">
          <div className="p-sm-3 p-md-3 p-lg-2">
            <div className="p-d-flex p-flex-column">
            <label htmlFor="poster">Poster Image</label>
              <input type="file" name="posterurl" onChange={this.onFileChange}/>
              <img
                className="p-shadow-3 poster-img"
                src={this.state.posterurl === ''?"/demo/img/premam-poster.jpg":this.state.posterurl}
                onError={(e) => (e.target.src = posterPlaceholder)}
                alt="poster"
              />
              <Button
                  className="upload-poster-btn p-button-danger p-m-1"
                  label="Clear"
                  icon="pi pi-times"
                />
              <Button
                  className="upload-poster-btn p-m-1"
                  label="Upload"
                  icon="pi pi-upload"
                  onClick={this.saveContentPoster}
                />
              </div>
              </div>

              <div className="p-sm-3 p-md-3 p-lg-2">
            <div className="p-d-flex p-flex-column">
            <label htmlFor="banner">Banner Image</label>
              <input type="file" name="moviebannerurl" onChange={this.onFileChange}/>
              <img
                className="p-shadow-3 poster-img"
                src={this.state.moviebannerurl === ''?"/demo/img/premam-poster.jpg":this.state.moviebannerurl}
                onError={(e) => (e.target.src = posterPlaceholder)}
                alt="poster"
              />
              <Button
                  className="upload-poster-btn p-button-danger p-m-1"
                  label="Clear"
                  icon="pi pi-times"
                />
              <Button
                  className="upload-poster-btn p-m-1"
                  label="Upload"
                  icon="pi pi-upload"
                  onClick={this.saveContentBanner}
                />
              
              </div>
              </div>

              <div className="p-sm-3 p-md-3 p-lg-2">
            <div className="p-d-flex p-flex-column">
              <input type="file" name="filepath" onChange={this.onFileChange}/>
             
              </div>
              </div>

              <div className="p-sm-3 p-md-3 p-lg-2">
            <div className="p-d-flex p-flex-column">
              <input type="file" name="trailerurl" onChange={this.onFileChange}/>
              
              </div>
              </div>

              <div className="upload-action-area p-mt-2 p-text-center">
                <Button
                  className="upload-poster-btn p-button-danger p-m-1"
                  label="Clear"
                  icon="pi pi-times"
                />
                <Button
                  className="upload-poster-btn p-m-1"
                  label="Next"
                  icon="pi pi-upload"
                  onClick={this.nextContent}

                />
              
          </div>
        </div>
      </div>
    );
  }
}

UploadModule.propTypes = {
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
      dispatch(addContentPosterRequest(data));
    },
    onSubmitBanner: data => {
      // if (evt !== undefined && evt.preventDefault) evt.preventDefault();
      dispatch(addContentBannerRequest(data));
    },
    onSubmitFormData: data => {
      // if (evt !== undefined && evt.preventDefault) evt.preventDefault();
      dispatch(addContentRequest(data));
    },
    onChange:(name,value)=>dispatch(onChange({name,value}))
  };
}

export default connect(
  mapStateToProps,
  mapDispatchToProps,
)(withRouter(UploadModule));
