import React, {Component} from 'react';

class SearchForm extends Component{

  constructor(props){
    super(props); // runs super() of parent class Component
    this.state = {
        orig: '',
        dest: ''
    }
  }

  handleSubmit(event){
      event.preventDefault();
      this.props.history.push(`/search/${this.state.orig}/${this.state.dest}`);
      console.log("hello");
  }

  handleInput(event){
    this.setState ({
      dest: event.target.value
    })
  }

  handleInput1(event){
    this.setState ({
      orig: event.target.value
    })
  }

  render(){
    return(
      <div>
        <h2>Search For Flights</h2>
        <form className="navbar" onSubmit={ ev => this.handleSubmit(ev) }>
          <label className="margin-right" htmlFor="orig">From: </label>
          <input className="margin-right" name="orig" className="searchField" type="text" onChange={ ev =>this.handleInput1(ev) } />
          <label className="margin-right margin-left" htmlFor="dest">To: </label>
          <input className="margin-right" name="dest" type="text" onChange={ ev =>this.handleInput(ev) } />
          <input className="margin-right" className="nav-button" type="submit" value="Find flights" />
        </form>
      </div>
    )
  }
}

export default SearchForm;
