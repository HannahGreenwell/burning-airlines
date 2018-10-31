import React, {Component} from 'react';

import axios from 'axios';

import SeatMap from './SeatMap';


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

  render() {
    return (
      <div className="flight_show">
        <p>{this.state.date} Flight {this.state.flightNum} {this.state.origin} - {this.state.destination}</p>

        <div className="seatmap-container">
          <SeatMap
            numOfRows={this.state.rows}
            numOfColumns={this.state.columns}
            reservedSeats={this.state.reservedSeats}
          />
        </div>
      </div>
    );
  }
}

export default FlightShow;
