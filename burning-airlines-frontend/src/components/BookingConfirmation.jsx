import React, {Component} from 'react';
import axios from 'axios';

class BookingConfirmation extends Component {

  constructor(props){
    super(props);

    //TODO take from props instead
    this.state = {
      name: "John Bananas",
      email: "john@bananarama.com",
      flightNumber: "QF09",
      date: "04-11-2018",
      destination: "Sydney",
      origin: "Melbourne",
      seatRow: "6",
      seatColumn: "3",
      model: "A380"
    };

  }

  componentDidMount() {
    //Eventually will set values from props like this:
    //this.setState({name: this.props.name});
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
