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
      reservedSeats: [],
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

      const newSeatReservations = [];

      response.data.reservations.forEach( r => {
        newSeatReservations.push([r.seatRow, r.seatColumn]);
      });

      // MUTATING reservedSeats - NEED TO FIX
      this.setState({
        rows: response.data.airplane.rows,
        columns: response.data.airplane.columns,
        date: response.data.flight.date,
        flightNum: response.data.flight.flight_number,
        origin: response.data.flight.origin,
        destination: response.data.flight.destination,
        reservedSeats: newSeatReservations
      })
    })
    .catch(console.warn)
  }

  renderSeat(row, column) {
    const seatWidthPercentage = `${(100 / this.state.columns) - 1}%`;
    let text = 'avail';
    let className = 'seat avail';

    if (this.state.reservedSeats.includes([parseInt(row), parseInt(column)])) {
      text = '';
      className = 'seat reserved';
    }

    return (
      <div
        className={className}
        row={row}
        column={column}
        style={{width: seatWidthPercentage}}
      >
      {text}
      </div>
    );
  }

  renderSeatMap() {
    let seatMap = [];

    for (let i = 1; i <= this.state.rows; i++) {
      let seats = [];

      for (let j = 1; j <= this.state.columns; j++) {
        seats.push(
          this.renderSeat(i, j)
        );
      }
      seatMap.push(<div className="row">{seats}</div>);
    }

    return seatMap;
  }

  render() {
    return (
      <div className="flight_show">
        <p>{this.state.date} Flight {this.state.flightNum} {this.state.origin} - {this.state.destination}</p>

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
