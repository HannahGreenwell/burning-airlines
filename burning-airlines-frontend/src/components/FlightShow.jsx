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
      model: '',
      reservedSeats: [],
      selectedSeat: [],
    };
  }

  componentDidMount() {
    this.fetchFlight(this.props.match.params.id);
    setInterval(() => this.fetchFlight(this.props.match.params.id), 2000);
  }

  fetchFlight(flightID) {
    const url = `http://localhost:3000/flight/${flightID}`

    axios.get(url)
    .then(response => {
      const newReservedSeats = response.data.reservations.map(r => [r.seatRow, r.seatColumn])

      this.setState({
        rows: response.data.airplane.rows,
        columns: response.data.airplane.columns,
        date: response.data.flight.date,
        flightNum: response.data.flight.flight_number,
        origin: response.data.flight.origin,
        destination: response.data.flight.destination,
        model: response.data.airplane.model,
        reservedSeats: newReservedSeats,
      })
    })
    .catch(console.warn)
  }

  handleClick(row, column) {
    this.setState({
      selectedSeat: [row, column]
    });
  }

  handleSubmit() {
    const url = `http://localhost:3000/reservations`;
    axios.post(url, {
      seatRow: this.state.selectedSeat[0],
      seatColumn: this.state.selectedSeat[1],
      email: 'bobby_boy@hotmail.com',
      flight_id: this.props.match.params.id
    })
    .then(response => {
      this.props.history.push(`/reservation/${response.data.id}`);
    })
    .catch(console.warn);
  }

  formatSelectedSeat() {
    const letters = '*abcdefghijklmnopqrstuvwxyz';
    const selectedSeat = `${this.state.selectedSeat[0]}${letters[this.state.selectedSeat[1]]}`;
    return selectedSeat;
  }

  isFlightFullyBooked(){
    const numOfSeats = this.state.rows * this.state.columns;
    if (numOfSeats - this.state.reservedSeats.length <= 0) {
      return true;
    } else {
      return false;
    }
  }

  render() {
    return (
      <div className="flight_show">
        {
          this.isFlightFullyBooked()
          ?
          <p className="bookedOutWarning">Sorry, Flight {this.state.flightNum} is booked out. Please select another flight.</p>
          :
          <table className="table-top">
            <thead>
            <tr><th>Date</th><th>Flight Number</th><th>Origin</th><th>Destination</th><th>Aircraft</th><th></th></tr>
            </thead>
            <tbody>
              <tr>
              <td>{this.state.date}</td><td>{this.state.flightNum}</td><td>{this.state.origin}</td><td>{this.state.destination}</td><td>{this.state.model}</td>
              </tr>
            </tbody>
          </table>
        }

        <form className="seat-selection" onSubmit={() => this.handleSubmit()}>
          <SeatMap
            numOfRows={this.state.rows}
            numOfColumns={this.state.columns}
            reservedSeats={this.state.reservedSeats}
            selectedSeat={this.state.selectedSeat}
            onClick={(row, column) => this.handleClick(row, column)}
          />

        <div className={
            `${this.isFlightFullyBooked()
              ? "hide-seat-submit"
              : "selected-seat-submit"}`}>
            {
              (this.state.selectedSeat.length > 0)
              ?
              <span className="current-seat upcase">{`Seat: ${this.formatSelectedSeat()}`}</span>
              :
              <span className="current-seat">Please select a seat</span>
            }
            <input type="submit" value="Confirm Flight" />
          </div>
        </form>
      </div>
    );
  }
}

export default FlightShow;
