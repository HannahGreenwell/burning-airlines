import React from 'react';
import {HashRouter as Router, Route} from 'react-router-dom';

import Header from './components/Header';
import SearchForm from './components/SearchForm';
import SearchResults from './components/SearchResults';
import FlightShow from './components/FlightShow';

const Routes = (
  <Router>
    <div>
      <Route component={Header} />
      <Route path="/search" component={SearchForm} />
      <Route exact path="/search/:query" component={SearchResults} />
      <Route exact path="/flight/:id" component={FlightShow} />
    </div>
  </Router>
);

export default Routes;
