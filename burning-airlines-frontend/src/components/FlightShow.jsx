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
        reservedSeats: [...this.state.reservedSeats, ...newReservedSeats],
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

  render() {
    return (
      <div className="flight_show">
        <p>{this.state.date} Flight {this.state.flightNum} {this.state.origin} - {this.state.destination} {this.state.model}</p>

        <form className="seat-selection" onSubmit={() => this.handleSubmit()}>
          <SeatMap
            numOfRows={this.state.rows}
            numOfColumns={this.state.columns}
            reservedSeats={this.state.reservedSeats}
            selectedSeat={this.state.selectedSeat}
            onClick={(row, column) => this.handleClick(row, column)}
          />

          <div className="selected-seat-submit">
            {
              (this.state.selectedSeat.length > 0)
              ?
              <span className="current-seat">{`Seat: ${this.state.selectedSeat.join('')}`}</span>
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
