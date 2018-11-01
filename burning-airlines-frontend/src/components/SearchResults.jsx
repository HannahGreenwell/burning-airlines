import React, {Component} from 'react';
import {Link} from 'react-router-dom';
import axios from 'axios';

import SearchForm from './SearchForm'

const ResultsList = (props) => {

  let i = 0;

  return(
    <table>
      <thead>
      <tr><th>Date</th><th>Flight Number</th><th>Origin</th><th>Destination</th><th>Aircraft</th><th></th></tr>
      </thead>
      <tbody>
      {props.flights.map(f =>
        <tr key={i++}>
        <td>{f.date}</td><td>{f.flight_number}</td><td>{f.origin}</td><td>{f.destination}</td><td>{f.airplane.model}</td><td><a href={"#/flight/" + f.id}>Select</a></td>
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
  }

  componentDidUpdate(prevProps) {
    if (this.props.match.params.orig !== prevProps.match.params.orig ||
    this.props.match.params.dest !== prevProps.match.params.dest) {
      this.performSearch(this.props.match.params.orig, this.props.match.params.dest);
    }
  }

  performSearch(orig, dest){
    console.log("origin:", orig);
    console.log("destination:", dest);
    const URL = 'http://localhost:3000/search/find';
    axios.post(URL, {from: orig, to: dest})
    .then(response=>{
      console.log(response.data);
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
