import React, {Component} from 'react';
import axios from 'axios';

class BookingConfirmation extends Component {

  constructor(props){
    super(props);

    this.state = {
      name: '',
      email: '',
      flightNumber: '',
      date: '',
      destination: '',
      origin: '',
      seatRow: '',
      seatColumn: '',
      model: ''
    };
  }

  componentDidMount() {
    const url = `http://localhost:3000/reservation/${this.props.match.params.id}`;

    axios.get(url)
    .then(response => {
      this.setState({
        name: response.data.user.name,
        email: response.data.user.email,
        flightNumber: response.data.flight.flight_number,
        date: response.data.flight.date,
        destination: response.data.flight.destination,
        origin: response.data.flight.origin,
        seatRow: response.data.reservation.seatRow,
        seatColumn: response.data.reservation.seatColumn,
        model: response.data.airplane.model
      })
    })
    .catch(console.warn)
  }

  render(){
    return(
      <div>
        <h1>Booking Confirmation</h1>
        <p><strong>Name: </strong>{this.state.name}</p>
        <p><strong>Email: </strong>{this.state.email}</p>
        <p><strong>Date: </strong>{this.state.date}</p>
        <p><strong>Flight Number: </strong>{this.state.flightNumber}</p>
        <p><strong>Origin: </strong>{this.state.origin}</p>
        <p><strong>Destination: </strong>{this.state.destination}</p>
        <p><strong>Plane Type: </strong>{this.state.model}</p>
        <p><strong>Seat: </strong>Row {this.state.seatRow}, Column {this.state.seatColumn}</p>
      </div>
    );
  }

}

export default BookingConfirmation;
