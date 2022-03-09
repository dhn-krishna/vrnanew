import React, { Component } from "react";
import "./Analytics.scss";
import { Chart } from "primereact/chart";
import { Divider } from 'primereact/divider';
class AnalyticsModule extends Component {
  state = {
    data: {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [
        {
          label: "First Dataset",
          data: [65, 59, 80, 81, 56, 55, 40],
          fill: false,
          borderColor: "#4bc0c0",
        },
        {
          label: "Second Dataset",
          data: [28, 48, 40, 19, 86, 27, 90],
          fill: false,
          borderColor: "#565656",
        },
      ],
    },
    chartData: {
      labels: ["A", "B", "C"],
      datasets: [
        {
          data: [300, 50, 100],
          backgroundColor: ["#e1b924", "#2c2c2c", "#22bcee"],
          hoverBackgroundColor: ["#e1b924", "#2c2c2c", "#22bcee"],
        },
      ],
    },
    radarData: {
      labels: [
        "Eating",
        "Drinking",
        "Sleeping",
        "Designing",
        "Coding",
        "Cycling",
        "Running",
      ],
      datasets: [
        {
          label: "My First dataset",
          backgroundColor: "rgba(179,181,198,0.2)",
          borderColor: "rgba(179,181,198,1)",
          pointBackgroundColor: "rgba(179,181,198,1)",
          pointBorderColor: "#fff",
          pointHoverBackgroundColor: "#fff",
          pointHoverBorderColor: "rgba(179,181,198,1)",
          data: [65, 59, 90, 81, 56, 55, 40],
        },
        {
          label: "My Second dataset",
          backgroundColor: "rgba(255,99,132,0.2)",
          borderColor: "rgba(255,99,132,1)",
          pointBackgroundColor: "rgba(255,99,132,1)",
          pointBorderColor: "#fff",
          pointHoverBackgroundColor: "#fff",
          pointHoverBorderColor: "rgba(255,99,132,1)",
          data: [28, 48, 40, 19, 96, 27, 100],
        },
      ],
    },
    barData: {
      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
        datasets: [
            {
                label: 'My First dataset',
                backgroundColor: '#e1b924',
                data: [65, 59, 80, 81, 56, 55, 40]
            },
            {
                label: 'My Second dataset',
                backgroundColor: '#22bcee',
                data: [28, 48, 40, 19, 86, 27, 90]
            }
        ]
    }
  };
  render() {
    const lightOptions = {
      legend: {
        labels: {
          fontColor: "#495057",
        },
      },
    };
    return (
      <div className="Analytics">
        <h2 className="p-pl-2">Analytics</h2>
        <Divider />
        <div className="p-grid">
          <div className="p-col-6">
            <div className="p-shadow-3 bg-w p-p-3">
              <Chart type="line" data={this.state.data} />
            </div>
          </div>
          <div className="p-col-6">
            <div className="p-shadow-3 bg-w p-p-3">
              <Chart
                type="pie"
                data={this.state.chartData}
                options={lightOptions}
              />
            </div>
          </div>
          <div className="p-col-6">
            <div className="p-shadow-3 bg-w p-p-3">
              <Chart
                type="radar"
                data={this.state.radarData}
                options={lightOptions}
              />
            </div>
          </div>
          <div className="p-col-6">
            <div className="p-shadow-3 bg-w p-p-3">
            <Chart type="horizontalBar" data={this.state.barData} options={lightOptions} />
            </div>
          </div>
          
        </div>
      </div>
    );
  }
}
export default AnalyticsModule;
