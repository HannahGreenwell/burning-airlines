import React, {Component} from 'react';

import axios from 'axios';

// const BA_URL = 'http://localhost:3000/flight/';

class FlightShow extends Component {

  constructor() {
    super();

    this.state = {
      rows: 0,
      columns: 0,
      date: '',
      flightNum: '',
      origin: '',
      destination: '',
    };
  }

  componentDidMount() {
    this.fetchFlight(18);
  }

  fetchFlight(flightID) {
    const url = `http://localhost:3000/flight/${flightID}`
    console.log('URL: ', url);

    axios.get(url)
    .then(response => {
      this.setState({
        rows: response.data.airplane.rows,
        columns: response.data.airplane.columns,
        date: response.data.date,
        flightNum: response.data.flightNum,
        origin: response.data.origin,
        destination: response.data.destination,
      })
    })
    .catch(console.warn)
  }

  renderSeatMap() {
    // console.log('Rows: ', this.state.rows);
    // console.log('Columns: ', this.state.columns);

    let seatMap = [];
    const seatWidthPercentage = `${(100 / this.state.columns) - 1}%`;
    console.log('SEAT WIDTH: ', seatWidthPercentage);

    for (let i = 0; i < this.state.rows; i++) {
      let seats = [];

      for (let j = 0; j < this.state.columns; j++) {
        seats.push(<div
          className="seat"
          row={i}
          column={j}
          style={{width: seatWidthPercentage}}
          >avail</div>);
      }
      seatMap.push(<div className="row">{seats}</div>);
    }

    return seatMap;
  }

  render() {
    return (
      <div className="flight_show">
        <p>{this.state.date} Flight {this.state.flightNum} {this.state.origin} &gt {this.state.destination}</p>

        <div className="seatmap-container">
          <div className="seatmap">
            {this.renderSeatMap()}
          </div>
        </div>
      </div>
    );
  }
}

export default FlightShow;
