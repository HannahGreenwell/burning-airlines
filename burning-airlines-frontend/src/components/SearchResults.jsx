import React, {Component} from 'react';
import {Link} from 'react-router-dom';
import axios from 'axios';

import SearchForm from './SearchForm'


class SearchResults extends Component {

  constructor(){
    super();
    this.state={
      flights: []
    }
  }

  componentDidMount(){
    console.log('This is running');
    this.performSearch(this.props.match.params.orig, this.props.match.params.dest);
  }

  performSearch(orig, dest){
    const URL = 'http://localhost:3000/search';
    const flightParams={
      from: orig,
      to: dest
    };
    axios.get(URL, {params: flightParams})
    .then(response=>{
      this.setState({flights: response})
    })
    .catch(console.warn)
  }

  render() {
    return (
      <h2>Flights</h2>

    );
  }
}

export default SearchResults;
