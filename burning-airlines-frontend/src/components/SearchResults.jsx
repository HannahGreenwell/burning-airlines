import React, {Component} from 'react';
import {Link} from 'react-router-dom';
import axios from 'axios';

import SearchForm from './SearchForm'

const ResultsList = (props) => {
  return(
    <div className="results_list">
      <h2>Search Results</h2>
      <ul>
        {props.flights.map(f => <li key={f.id}>
          {f.date}, <a href={"/flight/" + f.id}>{f.flight_number}</a>, {f.origin} > {f.destination}, {f.airplane.model}
          </li>)}
      </ul>
    </div>
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
    return (
      <div>
        <ResultsList flights={this.state.flights} />
      </div>
    );
  }
}

export default SearchResults;
