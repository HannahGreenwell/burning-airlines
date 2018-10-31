
import React, {Component} from 'react';
import {Link} from 'react-router-dom';
import axios from 'axios';

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
  }

  handleInput(event){
    this.setState ({
      orig: event.target.value
    })
  }

  handleInput1(event){
    this.setState ({
      dest: event.target.value
    })
  }

  render(){
    return(
      <div>
        <h2>SearchForm</h2>

        <form onSubmit={ ev => this.handleSubmit(ev) }>
          From: <input type="text" onChange={ ev =>this.handleInput1(ev) } /><br/>
        To: <input type="text" onChange={ ev =>this.handleInput(ev) } /><br/>
        <input type="submit" value="Find flights" />
        </form>
      </div>
    )
  }
}

export default SearchForm;
