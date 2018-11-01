import React, {Component} from 'react';
import axios from 'axios';

const ResultsList = (props) => {

  let i = 0;

  return(
    <div>
      <p><strong>Name: </strong>{props.name}</p>
      <p><strong>Email: </strong>{props.email}</p>
      <table>
        <thead>
        <tr><th>Seat Row</th><th>Seat Column</th><th>Date</th><th>Flight Number</th><th>Origin</th><th>Destination</th><th>Aircraft</th><th></th></tr>
        </thead>
        <tbody>
        {props.reservations.map(res =>
          <tr key={i++}>
          <td>{res.seatRow}</td><td>{res.seatColumn}</td><td>{res.flight.date}</td><td>{res.flight.flight_number}</td><td>{res.flight.origin}</td><td>{res.flight.destination}</td><td>{res.flight.airplane.model}</td>
          </tr>)
        }
        </tbody>
      </table>
    </div>
  );
};

class UserReservations extends Component {

  constructor(props){
    super(props);
    this.state={
      name: "",
      email: "",
      reservations: []
    }
  }

  componentDidMount(){
    //Need to pass this down
    //this.performSearch(this.props.match.params.email);
    this.performSearch("bobby_boy@hotmail.com");
  }

  performSearch(email){
    const URL = 'http://localhost:3000/user/reservations';
    axios.post(URL, {email: email})
    .then(response=>{
      this.setState({
        name: response.data.name,
        email: response.data.email,
        reservations: response.data.reservations
      });
    })
    .catch(console.warn)
  }

  render() {

    let resultsList = <p>No reservations found</p>;
    if(this.state.reservations.length > 0) {
      resultsList = <ResultsList name={this.state.name} email={this.state.email} reservations={this.state.reservations} />;
    }

    return (
      <div className="results_list">
        <h2>Your Reservations</h2>
        {resultsList}
      </div>
    );
  }
}

export default UserReservations;
