import React, {Component} from 'react';
import axios from 'axios'

const URL = 'http://localhost:3000/flights';

class SearchForm extends Component {

  constructor(props){
    super(props)
    this.state={
    flights: []
    }
  }

  componentDidMount(){
    this.fetchFlights();
    setInterval(()=>this.fetchFlights(),2000);
  }

  fetchFlights(){
    axios.get(URL)
    .then(response=>{
      console.log(response);

    })
  }



  render() {
    return (
      <div>
        <ul>
          { this.state.flights.map( s => <li key={s.id}>{ s.flight_id }</li> ) }
        </ul>
      </div>

    );
  }
}

export default SearchForm;
