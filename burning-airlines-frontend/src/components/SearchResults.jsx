import React, {Component} from 'react';
import {Link} from 'react-router-dom';
import axios from 'axios';

const ResultsList = (props) => {

  let i = 0;


  return(
    <table>
      <thead>
        <tr>
          <th>Date</th>
          <th>Flight Number</th>
          <th>Origin</th>
          <th>Destination</th>
          <th>Aircraft</th>
          <th>Aircraft capacity</th>
          <th>Seats available</th>
        </tr>
      </thead>
      <tbody>
        {
          props.flights.map(f =>
          <tr key={i++}>
            <td>{f.date}</td>
            <td><Link to={`/flight/${f.id}`}>{f.flight_number}</Link></td>
            <td>{f.origin}</td>
            <td>{f.destination}</td>
            <td>{f.airplane.model}</td>
            <td>{f.airplane.rows * f.airplane.columns}</td>
            <td className={f.airplane.rows * f.airplane.columns - f.reservations.length === 0 ? "seats-unavailable" : "seats-available"}>{f.airplane.rows * f.airplane.columns - f.reservations.length}</td>
          </tr>)
        }
      </tbody>
    </table>
  );
};

class SearchResults extends Component {

  constructor(props){
    super(props);
    this.state={
      flights: []
    }
  }

  componentDidMount(){
    this.performSearch(this.props.match.params.orig, this.props.match.params.dest);
    setInterval(() => this.performSearch(this.props.match.params.orig, this.props.match.params.dest), 2000);
  }

  componentDidUpdate(prevProps) {
    if (this.props.match.params.orig !== prevProps.match.params.orig ||
    this.props.match.params.dest !== prevProps.match.params.dest) {
      this.performSearch(this.props.match.params.orig, this.props.match.params.dest);
    }
  }

  performSearch(orig, dest){
    const URL = 'http://localhost:3000/search/find';
    axios.post(URL, {from: orig, to: dest})
    .then(response=>{
      this.setState({flights: response.data.flights})
    })
    .catch(console.warn)
  }

  render() {

    let resultsList = <p>No results found</p>;
    if(this.state.flights.length > 0) {
      resultsList = <ResultsList flights={this.state.flights} />;
    }

    return (
      <div className="results_list">
        <h2>Search Results</h2>
        {resultsList}
      </div>
    );
  }
}

export default SearchResults;
