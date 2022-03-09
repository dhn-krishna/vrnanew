import React, { Component } from "react";
import { Link, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import ReactHighcharts from 'react-highcharts';
import Highcharts from 'highcharts';
import "./Analytics.scss";
// import { Chart } from "primereact/chart";

import { Divider } from 'primereact/divider';
import { analyticsRequest } from "./actions";
class Analytics extends Component {
  constructor(props) {
    super(props);
    this.state = {}
  }

  componentDidMount() {
    this.props.onFetchAnalytics();
  }

  render() {
    console.log('analytics',this.props.analytics);
    var pieData =[];
    if(this.props.analytics.data !== null){
      var dataVal = Object.entries(this.props.analytics.data.data.data);
      console.log(dataVal);
      dataVal.map((res,key)=>{
        let obj = {
          'name':res[0],
          'y':res[1]
        }
        pieData.push(obj);
        console.log(res[0]);
        
        console.log(res[1]);
      })
    }
    console.log(pieData);
    const lightOptions = {
      legend: {
        labels: {
          fontColor: "#495057",
        },
      },
    };
    const options = {

      title: {
        text: 'Solar Employment Growth by Sector, 2010-2016'
      },
    
      subtitle: {
        text: 'Source: thesolarfoundation.com'
      },
    
      yAxis: {
        title: {
          text: 'Number of Employees'
        }
      },
    
      xAxis: {
        accessibility: {
          rangeDescription: 'Range: 2010 to 2017'
        }
      },
    
      legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
      },
    
      plotOptions: {
        series: {
          label: {
            connectorAllowed: false
          },
          pointStart: 2010
        }
      },
    
      series: [{
        name: 'Installation',
        data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
      }, {
        name: 'Manufacturing',
        data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
      }, {
        name: 'Sales & Distribution',
        data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
      }, {
        name: 'Project Development',
        data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
      }, {
        name: 'Other',
        data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
      }],
    
      responsive: {
        rules: [{
          condition: {
            maxWidth: 500
          },
          chartOptions: {
            legend: {
              layout: 'horizontal',
              align: 'center',
              verticalAlign: 'bottom'
            }
          }
        }]
      }

    };


    const pie = {
      chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
      },
      title: {
        text: 'Browser market shares in January, 2018'
      },
      tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
      },
      accessibility: {
        point: {
          valueSuffix: '%'
        }
      },
      plotOptions: {
        pie: {
          allowPointSelect: true,
          cursor: 'pointer',
          dataLabels: {
            enabled: true,
            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
          }
        }
      },
      series: [{
        name: 'Movies',
        colorByPoint: true,
        data: pieData
      }]
    }
    return (
      <div className="Analytics">
        <h2 className="p-pl-2">Analytics</h2>
        
        <Divider />
        <div className="p-grid">
          <div className="p-col-6">
            <div className="p-shadow-3 bg-w p-p-3">
            <ReactHighcharts highcharts={Highcharts} config={options}/>
              {/* <Chart type="line" data={this.state.data} /> */}
            </div>
          </div>
          <div className="p-col-6">
            <div className="p-shadow-3 bg-w p-p-3">
            <ReactHighcharts highcharts={Highcharts} config={pie}/>
              {/* <Chart
                type="pie"
                data={this.state.chartData}
                options={lightOptions}
              /> */}
            </div>
          </div>
          <div className="p-col-6">
            <div className="p-shadow-3 bg-w p-p-3">
              {/* <Chart
                type="radar"
                data={this.state.radarData}
                options={lightOptions}
              /> */}
            </div>
          </div>
          <div className="p-col-6">
            <div className="p-shadow-3 bg-w p-p-3">
            {/* <Chart type="horizontalBar" data={this.state.barData} options={lightOptions} /> */}
            </div>
          </div>
          
        </div>
      </div>
    );
  }
}

Analytics.propTypes = {
  onFetchAnalytics: PropTypes.func,
  analytics: PropTypes.object
};

function mapStateToProps(state){
  return { analytics: state.analytics};
}

function mapDispatchToProps(dispatch) {
  return {
    onFetchAnalytics: () =>dispatch(analyticsRequest()),
  };
}

export default connect(
  mapStateToProps,
  mapDispatchToProps,
)(withRouter(Analytics));
